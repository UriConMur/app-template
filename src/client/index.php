<!DOCTYPE html>
<html>
<head>
<title>Beliveo</title>
  <script src="node_modules/beliveo-files/utils/urlFix/index.js"></script>
  <link rel="stylesheet" type="text/css" href="node_modules/beliveo-files/styles/main.css">
</head>
<body>
<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
require '../../config/environment.php';
?>
<?php require_once '../../node_modules/beliveo-files/components/header.php'; ?>
<div class="body_container">
    <?php
    $cookie_name = 'unou';
    if (! isset($_COOKIE[ $cookie_name ])) {
        session_destroy();
        header("location: {$_ENV['LOGIN_URL']}?redirect_to={$_ENV['DOMAIN']}/{$_ENV['NAME_APP']}");
    } else {
        if (isset($_GET['p'])) {
            $redirect = $_GET['p'];
            include "pages/{$redirect}/index.php";
        } else {
            include 'pages/home/index.php';
        }
    }
    ?>
</div>
<?php require_once '../../node_modules/beliveo-files/components/footer.php'; ?>
</body>
</html>
