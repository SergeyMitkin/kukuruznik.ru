<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<!-- bootstrap -->
	<link rel="stylesheet" href="/js/ckeditor/contents.css" type="text/css" charset="utf-8">
	<link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" charset="utf-8">
	<link rel="stylesheet" href="/css/admin/main.css" type="text/css">    
	<link rel="stylesheet" href="/css/admin.style.css" type="text/css" charset="utf-8">
	<link rel="stylesheet" href="/css/quickbox.css" type="text/css" charset="utf-8">

	<script src="http://code.jquery.com/jquery-1.8.2.js"></script>
	<script src="/js/jquery.maskedinput.min.js"></script>
	<script src="/js/quickbox.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/ckeditor/ckeditor.js"></script>
	<script src="/js/ckeditor/styles.js"></script>
	<!-- /bootstrap -->

	<link rel="stylesheet" type="text/css" href="/js/uploadify/uploadify.css" />
	<script type="text/javascript" src="/js/uploadify/jquery.uploadify-3.1.min.js"></script>

	{if isset($redirect)}
		<script type="text/javascript">
			document.location.href = '{$redirect}';
		</script>
	{/if}

	<title>Панель администратора</title>	
	<link rel="icon" type="image/png" href="/adminfavicon.png">
</head>
<body>

<div class="navbar navbar-inverse">
	<div class="navbar-inner">
		<ul class="nav">
			<li><a href="/admin/orders">Заявки</a></li>
			<li><a href="/admin/news">Новости</a></li>
			<li><a href="/admin/articles">Статьи</a></li>
			<li><a href="/admin/configs">Параметры</a></li>
			<li><a href="/admin/pages">Страницы</a></li>
			<li><a href="/admin/meta">Мета-теги</a></li>
			<li><a href="/admin/mails">Рассылки</a></li>
			<li><a href="/admin/galery">Галерея</a></li>
			<li><a href="/admin/infos">Информация</a></li>            
			<li><a href="/admin/comments">Отзывы</a></li>
			<li><a href="/admin/files">Файлы</a></li>
			<li><a href="/admin/lettemps">Шаблоны писем</a></li>
			<li><a href="/admin/login/logout">Выход</a></li>
		</ul>
	</div>
</div>
<div class="container">
    <div class="span12">
