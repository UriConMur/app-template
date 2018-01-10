<?php
/**
 * PHP Version 5
 *
 * Middleware Doc Comment
 *
 * @category Middleware
 * @package  Home
 * @author   Salvador Gonzalez <salvador.gonzalez@beliveo.com>
 * @license  https://github.com/SDBLV/bbox-login/blob/develop/LICENSE.md MIT
 * @link     http://www.beliveo.net/bbox-login
 */

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
