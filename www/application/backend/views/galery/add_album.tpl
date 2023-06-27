{include file="header.tpl"}
<form action="http://{$smarty.server.SERVER_NAME}/admin/index.php/galery/add_album" method="POST">
	Название: <input type="text" name="name" /><br>
	Кодовое имя (латинскими буквами): <input type="text" name="codename" /><br>
	<input type="submit" />
</form>
{include file="footer.tpl"}
