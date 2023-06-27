<?php
	error_reporting(E_ALL);
	chdir(__DIR__);
	$log = fopen("mailerlog/log.txt",'a+');

	require_once('phpmailer/class.phpmailer.php');
	include('mailconfig.php');

	$db = mysql_connect("u40938.mysql.masterhost.ru", "u40938", "_Ffe9omaTMATO"); mysql_select_db("u40938_kukuruz", $db);
	mysql_query("SET NAMES UTF8");

	$today = date('Y-m-d');
	//$today = $_GET['date'];

	fwrite($log, "\n\n----------------------------------------------\n");
	fwrite($log, "Сегодня $today, забираем все рассылки на сегодня\n");

	$letter_query = mysql_query("SELECT * FROM `letters` WHERE `date`='$today'") or die(mysql_error());

	if(mysql_num_rows($letter_query) <= 0){
		fwrite($log, "На сегодня писем нет, сворачиваемся\n");
	}else{
		fwrite($log, "Письма имеются, открываю первое\n");
		while($letter = mysql_fetch_array($letter_query)){
			fwrite($log, "Заголовок письма: ".$letter['title']."\n");

			$addresses = explode(', ',$letter['addresses']);
			$attached = explode(', ',$letter['attached']);

			$date_id = $letter['date_id'];

			$dates = mysql_query("SELECT * FROM `dates` WHERE `Id` = '$date_id'") or die(mysql_error());
			$date = mysql_fetch_assoc($dates);
			$orders_query = mysql_query("SELECT * FROM `orders` WHERE `date` = '".$date['date']."' AND `type` = '".$date['jumptype']."'") or die(mysql_error());

			while($order = mysql_fetch_assoc($orders_query)){
				$orders[] = $order; 
			}

			$mail->AddAttachment($attached[0]);

			if(!empty($orders)){
				fwrite($log, "Получатели есть\n");
				foreach($orders as $order){
					$mail->IsHTML(true);
					$mail->Subject = $letter['title'];
					//$mail->Body = $letter['content']."\r\n<br>Для активации перейдите по ссылке <a href='http://kukuruznik.com/mails/activate/".md5($order['email'])."'>http://kukuruznik.com/mails/activate/".md5($order['email'])."</a>";
					$mail->Body = $letter['content'];

					$mail->AddAddress($order['email']);

					if ($mail->Send()){
						fwrite($log, "Письмо по адресу: ".$order['email']." отправлено\n");
					}else{
						fwrite($log, "Письмо по адресу: ".$order['email']." НЕ отправлено\n");
					}

					$orderupdate_query = mysql_query("UPDATE `orders` SET `confirmation`='sended' WHERE `Id`='".$order['Id']."'") or die(mysql_error());
					$mail->ClearAddresses();
				}
			}else{
				fwrite($log, "Получателей нет\n");
			}

			$mail->ClearAttachments();
			unset($orders);
		}
	}
	fwrite($log,time()."\n");
	fclose($log);
?>
