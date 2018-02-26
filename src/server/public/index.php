<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

require_once '../../../vendor/autoload.php';
require_once '../../../config/environment.php';

$app = new \Slim\App;

require_once '../src/config/db.php';
require_once '../src/config/controller.php';

// Customer Routes
require_once '../src/routes/page.php';
require_once '../src/routes/rule.php';
require_once '../src/routes/permission.php';

$app->run();
