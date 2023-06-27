{include file="header.tpl"}
<form action="http://{$smarty.server.SERVER_NAME}/admin/index.php/galery/add_video" method="POST">
Введите название видео: <input type="text" name="title" /><br>
Введите код вставки видео:<br><textarea name="code"></textarea><br>
<input type="submit" />
</form>
{include file="footer.tpl"}
