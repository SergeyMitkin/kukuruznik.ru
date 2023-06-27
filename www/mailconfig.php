<?php
	$mail = new PHPMailer();
	$mail->CharSet = 'UTF-8';
	$mail->SMTPDebug = 1;
	$mail->IsSMTP(); // telling the class to use SMTP
	$mail->SMTPAuth      = true;                  // enable SMTP authentication
	$mail->SMTPSecure = 'ssl'; // secure transfer enabled REQUIRED for GMail
	$mail->SMTPKeepAlive = true;                  // SMTP connection will not close after each email sent
	$mail->Host          = "smtp.mail.ru"; // sets the SMTP server
	$mail->Port          = 465;                    // set the SMTP port for the GMAIL server
	$mail->Username      = "jump@kukuruznik.com"; // SMTP account username
	$mail->Password      = "SzEJthWRnxZBmMCNFCWu";        // SMTP account password
//	$mail->Password      = "1Spt)oiLtNS2";        // SMTP account password
	$mail->SetFrom('jump@kukuruznik.com', 'Прыжки с парашютом');
	$mail->AddReplyTo('jump@kukuruznik.com', 'Прыжки с парашютом');
//	$mail->Host          = "smtp.kukuruznik.com"; // sets the SMTP server
//	$mail->Port          = 25;                    // set the SMTP port for the GMAIL server
//	$mail->Username      = "jump@kukuruznik.com"; // SMTP account username
//	$mail->Password      = "gjnB629gifdtkF";        // SMTP account password
//	$mail->SetFrom('joker-main@yandex.ru', 'Прыжки с парашютом');
//	$mail->AddReplyTo('joker-main@yandex.ru', 'Прыжки с парашютом');
?>
