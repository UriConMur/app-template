<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app->get(
    '/permission/position/{idPage}',
    function (Request $request, Response $response) {
      $case       = 7;
      $idPage       = trim($request->getAttribute('idPage'));
      $data       = join('|-|', array($idPage));
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
          $status->message = 'Permission Found';
      } else {
          $status->code    = 404;
          $status->message = 'Permission not found';
      }

      $response_obj->body   = $body;
      $response_obj->status = $status;

      echo json_encode($response_obj);
    }
);

$app->get(
    '/permission/employee/{idPage}',
    function (Request $request, Response $response) {
      $case       = 8;
      $idPage       = trim($request->getAttribute('idPage'));
      $data       = join('|-|', array($idPage));
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
          $status->message = 'Permission Found';
      } else {
          $status->code    = 404;
          $status->message = 'Permission not found';
      }

      $response_obj->body   = $body;
      $response_obj->status = $status;

      echo json_encode($response_obj);
    }
);

$app->post(
    '/permission/position/{idPage}',
    function (Request $request, Response $response) {
      $case       = 3;
      $id_action = 1;
      $id_type = 2;
      $id_page       = trim($request->getAttribute('idPage'));
      $target       = trim($request->getParam('target'));
      $rules       = trim($request->getParam('rules'));
      $data       = join('|-|', array($id_action,$id_type,$id_page,$rules,$target));
      $editor     = $_SESSION['id_employee'];
      $sql        = 'CALL sp_perm_check(:case, :data, :editor)';
      $results    = connectDataBase($sql, $case, $data, $editor);
      $body         = new stdClass();
      $status       = new stdClass();
      $user         = new stdClass();
      $response_obj = new stdClass();
      if (count($results) > 0) {
          $body            = $results;
          $status->code    = 201;
          $status->message = 'Permission Added Succesfully';
      } else {
          $status->code    = 500;
          $status->message = 'Interval Server Error';
      }

      $response_obj->body   = $body;
      $response_obj->status = $status;

      echo json_encode($response_obj);
    }
);

$app->post(
    '/permission/employee/{idPage}',
    function (Request $request, Response $response) {
      $case      = 3;
      $id_action = 1;
      $id_type = 1;
      $id_page       = trim($request->getAttribute('idPage'));
      $target       = trim($request->getParam('target'));
      $rules       = trim($request->getParam('rules'));
      $data       = join('|-|', array($id_action,$id_type,$id_page,$rules,$target));
      $editor     = $_SESSION['id_employee'];
      $sql        = 'CALL sp_perm_check(:case, :data, :editor)';
      $results    = connectDataBase($sql, $case, $data, $editor);
      $body         = new stdClass();
      $status       = new stdClass();
      $user         = new stdClass();
      $response_obj = new stdClass();
      if (count($results) > 0) {
          $body            = $results;
          $status->code    = 201;
          $status->message = 'Permission Added Succesfully';
      } else {
          $status->code    = 500;
          $status->message = 'Interval Server Error';
      }

      $response_obj->body   = $body;
      $response_obj->status = $status;

      echo json_encode($response_obj);
    }
);

$app->delete(
    '/permission/position/{idPage}',
    function (Request $request, Response $response) {
      $case       = 3;
      $id_action = 2;
      $id_type = 2;
      $id_page       = trim($request->getAttribute('idPage'));
      $target       = trim($request->getParam('target'));
      $rules       = "NA";
      $data       = join('|-|', array($id_action,$id_type,$id_page,$rules,$target));
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
          $status->message = 'Permission Deleted Succesfully';
      } else {
          $status->code    = 500;
          $status->message = 'Interval Server Error';
      }

      $response_obj->body   = $body;
      $response_obj->status = $status;

      echo json_encode($response_obj);
    }
);

$app->delete(
    '/permission/employee/{idPage}',
    function (Request $request, Response $response) {
      $case      = 3;
      $id_action = 2;
      $id_type = 1;
      $id_page       = trim($request->getAttribute('idPage'));
      $target       = trim($request->getParam('target'));
      $rules       = "NA";
      $data       = join('|-|', array($id_action,$id_type,$id_page,$rules,$target));
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
          $status->message = 'Permission Deleted Succesfully';
      } else {
          $status->code    = 500;
          $status->message = 'Interval Server Error';
      }

      $response_obj->body   = $body;
      $response_obj->status = $status;

      echo json_encode($response_obj);
    }
);
