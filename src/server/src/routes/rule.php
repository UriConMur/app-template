<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app->get(
    '/rules',
    function (Request $request, Response $response) {
        $case       = 6;
        $data       = join('|-|', array());
        $editor     = $_SESSION['id_employee'];
        $sql        = 'CALL sp_perm_check(:case, :data, :editor)';
        $results    = connectDataBase($sql, $case, $data, $editor);
        $body         = new stdClass();
        $status       = new stdClass();
        $user         = new stdClass();
        $response_obj = new stdClass();
        if (count($results) > 0) {
            $body            = $results;
            $status->code    = 200;
            $status->message = 'Rule Found';
        } else {
            $status->code    = 404;
            $status->message = 'Rules not found';
        }

        $response_obj->body   = $body;
        $response_obj->status = $status;

        echo json_encode($response_obj);
    }
);
