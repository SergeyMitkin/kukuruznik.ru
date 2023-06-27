{include file="header.tpl"}
<form action="http://{$smarty.server.SERVER_NAME}/admin/index.php/configs/edit/{$config.Id}" method="POST">
	Имя: <input type="text" value="{$config.name}" name="name" /><br>
	Значение: <br><textarea name="value" style="width:800px; height:500px;">{$config.value}</textarea><br>
	<input type="submit" value="Сохранить" />
</form>
{include file="footer.tpl"}
