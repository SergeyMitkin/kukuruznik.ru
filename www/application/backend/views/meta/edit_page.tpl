{include file="header.tpl"}
<form action="http://{$smarty.server.SERVER_NAME}/admin/index.php/meta/edit/{$page.Id}" method="POST">
Путь: <input type="text" value="{$page.uri}" name="uri" /><br><br>
Заголовок: <input type="text" value="{$page.title}" name="title" /><br><br>
Ключевые слова:<br>
<textarea name="keywords">{$page.keywords}</textarea><br><br>
Описание:<br>
<textarea name="description">{$page.description}</textarea><br><br>
<input type="submit" value="Сохранить" />
</form>
{include file="footer.tpl"}
