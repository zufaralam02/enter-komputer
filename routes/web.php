<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    // return $router->app->version();
    return 'Welcome';
});

$router->group(['prefix' => 'table'], function () use ($router) {
    $router->get('/', 'TableController@index');
});

$router->group(['prefix' => 'printer'], function () use ($router) {
    $router->get('/', 'PrinterController@index');
});

$router->group(['prefix' => 'category'], function () use ($router) {
    $router->get('/', 'CategoryController@index');
});

$router->group(['prefix' => 'product'], function () use ($router) {
    $router->get('/', 'ProductController@index');
});

$router->group(['prefix' => 'order'], function () use ($router) {
    $router->get('/{code}', 'OrderController@get');
    $router->post('/', 'OrderController@order');
});
