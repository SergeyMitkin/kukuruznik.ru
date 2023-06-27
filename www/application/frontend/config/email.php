<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
//NOT STANDART FILE. CREATED AND SET BY ALEXEEV.
	$config['useragent'] = 'kukuruznik.com';
	$config['protocol'] = 'smtp';
	$config['mailpath'] = '/usr/sbin/sendmail';
	$config['smtp_host'] = 'smtp.kukuruznik.com';
//	$config['smtp_host'] = 'smtp.yandex.ru';
	$config['smtp_user'] = 'jump@kukuruznik.com';
//	$config['smtp_pass'] = 'kuk45Vfczyz15jum_';
	$config['smtp_pass'] = 'SzEJthWRnxZBmMCNFCWu';
//	$config['smtp_port'] = '25';
	$config['smtp_port'] = '465';
	$config['smtp_timeout'] = '10';
	$config['wordwrap'] = TRUE;
	$config['wrapchars'] = '76';
	$config['mailtype'] = 'html';
	$config['charset'] = 'UTF-8';
	$config['validate'] = TRUE;
	$config['priority'] = '';
	$config['crlf'] = '\r\n';
	$config['newline'] = '\r\n';
	$config['bcc_bacth_mode'] = FALSE;
	$config['bcc_bacth_size'] = '200';
?>
