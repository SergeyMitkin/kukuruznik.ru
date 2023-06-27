{include file="header.tpl"}
<form action="http://{$smarty.server.SERVER_NAME}/admin/index.php/configs/add" method="POST">
	Имя: <input type="text" name="name" /><br>
	Значение: <br><textarea name="value" style="width:800px; height:500px;"></textarea><br>
	<input type="submit" value="Сохранить" />
</form>
{include file="footer.tpl"}
