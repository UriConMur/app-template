<?php
/**
 * PHP Version 5
 *
 * Api Doc Comment
 *
 * @category File
 * @package  DB
 * @author   Salvador Gonzalez <salvador.gonzalez@beliveo.com>
 * @license  https://github.com/SDBLV/bbox-login/blob/develop/LICENSE.md MIT
 * @link     http://www.beliveo.net/bbox-login
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app = new \Slim\App;

$app->get(
    '/api/test',
    function (Request $request, Response $response) {
        echo 'Hello API World';
    }
);
