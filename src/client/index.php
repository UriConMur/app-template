<!DOCTYPE html>
<html>
<head>
<title>Beliveo</title>
  <link rel="stylesheet" type="text/css" href="src/client/styles/main.css">
</head>
<body>
<?php require_once '../../node_modules/beliveo-components/components/header.php'; ?>
<div class="body_container">
    <?php
    require '../../config/environment.php';
    $cookie_name = 'unou';
    if (! isset($_COOKIE[ $cookie_name ])) {
        header("location: {$_ENV['LOGIN_URL']}?redirect_to={$_ENV['DOMAIN']}/app-template");
    } else {
        if (isset($_GET['p'])) {
            $redirect = $_GET['p'];
            include "pages/{$redirect}/index.html";
        } else {
            include 'pages/home/index.html';
        }
    }
    ?>
</div>

<?php require_once '../../node_modules/beliveo-components/components/footer.php'; ?>
</body>
</html>
