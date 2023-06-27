{include file="header.tpl"}
{foreach from=$videos item=video}
{$video.code}
<br>
<a href="http://{$smarty.server.SERVER_NAME}/admin/index.php/galery/edit_video/{$video.Id}">Переименовать</a>&nbsp;<a href="http://{$smarty.server.SERVER_NAME}/admin/index.php/galery/remove_video/{$video.Id}">Удалить</a>
{/foreach}
{include file="footer.tpl"}
