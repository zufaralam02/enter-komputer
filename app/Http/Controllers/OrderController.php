<?php

namespace App\Http\Controllers;

use App\Http\Helper;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use App\Models\Table;
use App\Models\Variant;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class OrderController extends Controller
{
    public function __construct() {}

    public function get($code)
    {
        $order = Order::where('code', $code)->with('order_detail.category')
            ->with('order_detail.product')
            ->with('order_detail.variant')
            ->first();

        if (!$order) return Helper::responseError(null, 'Order not found', 200);

        return Helper::responseSuccess($order, 'Get order successfully', 200);
    }

    public function order(Request $request)
    {
        $table = $request->input('table_id');

        $rules = [
            'table_id' => 'required|numeric',
            'product.*.id' => 'required|numeric',
            'product.*.quantity' => 'required|numeric|min:1'
        ];

        $messages = [];

        $validator = Validator::make($request->all(), $rules, $messages);

        if ($validator->fails()) return Helper::responseError(null, $validator->errors()->first());

        $checkTable = Table::select('id')->find($table);
        if (!$checkTable) return Helper::responseError(null, 'Table not found');

        DB::beginTransaction();
        try {
            $price = 0;
            $items = 0;
            $data = [];
            $printer = [];

            $orderCode = Str::random(15);

            for ($i = 0; $i < count($request->product); $i++) {
                $product = Product::find($request->product[$i]['id']);
                if (!$product) return Helper::responseError(null, 'Product not found', 200);

                if ($product->has_variant == '1') {
                    $rules = [
                        "product.$i.variant_id" => 'required|numeric'
                    ];

                    $messages = [];

                    $validator = Validator::make($request->all(), $rules, $messages);

                    if ($validator->fails()) return Helper::responseError(null, $validator->errors()->first());

                    $variant = Variant::where('product_id', $request->product[$i]['id'])->find($request->product[$i]['variant_id']);
                    if (!$variant) return Helper::responseError(null, 'Variant not found', 200);

                    $price += $variant->price * $request->product[$i]['quantity'];
                } else {
                    $price += $product->price * $request->product[$i]['quantity'];
                }

                $items += $request->product[$i]['quantity'];

                $orderDetail = new OrderDetail();
                $orderDetail->order_code = $orderCode;
                $orderDetail->category_id = $product->category_id;
                $orderDetail->product_id = $request->product[$i]['id'];
                $orderDetail->variant_id = $product->has_variant == '1' ? $variant->id : 0;
                $orderDetail->price = $product->has_variant == '1' ? $variant->price : $product->price;
                $orderDetail->quantity = $request->product[$i]['quantity'];
                $orderDetail->price_total = $product->has_variant == '1' ? $variant->price * $request->product[$i]['quantity'] : $product->price * $request->product[$i]['quantity'];
                $orderDetail->save();

                if ($product->category_id == 1) {
                    if ($product->has_variant == '1') {
                        $printer['Printer Dapur'][] = [
                            'category' => 'Makanan',
                            'product' => $product->name,
                            'variant' => $variant->name,
                            'price' => $variant->price,
                            'quantity' => $request->product[$i]['quantity']
                        ];
                    } else {
                        $printer['Printer Dapur'][] = [
                            'category' => 'Makanan',
                            'product' => $product->name,
                            'price' => $product->price,
                            'quantity' => $request->product[$i]['quantity']
                        ];
                    }
                } else if ($product->category_id == 2) {
                    if ($product->has_variant == '1') {
                        $printer['Printer Bar'][] = [
                            'category' => 'Minuman',
                            'product' => $product->name,
                            'variant' => $variant->name,
                            'price' => $variant->price,
                            'quantity' => $request->product[$i]['quantity']
                        ];
                    } else {
                        $printer['Printer Bar'][] = [
                            'category' => 'Minuman',
                            'product' => $product->name,
                            'price' => $product->price,
                            'quantity' => $request->product[$i]['quantity']
                        ];
                    }
                } else if ($product->category_id == 3) {
                    $printer['Printer Kasir'][] = [
                        'category' => 'Promo',
                        'product' => $product->name,
                        'price' => $product->price,
                        'quantity' => $request->product[$i]['quantity']
                    ];
                }
            }

            $order = new Order();
            $order->code = $orderCode;
            $order->price = $price;
            $order->items = $items;
            $order->table = $table;
            $order->save();

            DB::commit();
        } catch (Exception $e) {
            DB::rollBack();
            Log::info(SESSIONID . ' ' . $e->getMessage());
            return Helper::responseError(null, 'Create order failed', 200);
        }

        $data = [
            'order_code' => $orderCode,
            'printer' => $printer
        ];

        return Helper::responseSuccess($data, 'Create order Successfully', 200);
    }
}
