<?php
require_once('phpmailer/class.phpmailer.php');
include('mailconfig.php');
$mail->IsHTML(true);
$mail->Subject = 'test';
$mail->Body = 'testtest';
$mail->AddAddress('alexeev.corp@gmail.com');
$mail->Send();
