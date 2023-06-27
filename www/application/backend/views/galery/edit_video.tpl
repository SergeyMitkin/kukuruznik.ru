{include file="header.tpl"}
{foreach from=$videos item=video}
<form action="http://{$smarty.server.SERVER_NAME}/admin/index.php/galery/edit_video/{$video.Id}" method="POST">
Введите название видео: <input type="text" value="{$video.title}" name="title" /><br>
Введите код вставки видео:<br><textarea name="code">{$video.code}</textarea><br>
<input type="submit" />
</form>
{/foreach}
{include file="footer.tpl"}
