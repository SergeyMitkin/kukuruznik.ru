{include file="header.tpl"}
{foreach from=$albums item=album}
<form action="http://{$smarty.server.SERVER_NAME}/admin/index.php/galery/edit_album/{$album.Id}" method="POST">
	Название: <input type="text" value="{$album.name}" name="name" /><br>
	Кодовое имя (латинскими буквами): <input type="text" value="{$album.codename}" name="codename" /><br>
	<input type="submit" />
</form>
{/foreach}
{include file="footer.tpl"}
