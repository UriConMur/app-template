<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

require_once '../../../vendor/autoload.php';
require_once '../../../config/environment.php';

$app = new \Slim\App;

include_once '../src/config/db.php';
include_once '../src/config/controller.php';

// Customer Routes
include_once '../src/routes/page.php';
include_once '../src/routes/rule.php';
include_once '../src/routes/permission.php';

$app->run();
