<?php
//include("class.smtp.php"); // optional, gets called from within class.phpmailer.php if not already loaded
function sendmail($mail_to,$subject,$content,$attached,$sended){
	require_once('phpmailer/class.phpmailer.php');
	include('mailconfig.php');

	$mail->IsHTML(true);
	$mail->Subject = $subject;
	$mail->Body = $content;
	$mail->AddAddress($mail_to);

	if(!empty($attached)){
		$mail->AddAttachment('uploads/'.$attached);
	}

	$mail->Send();
}
?>
