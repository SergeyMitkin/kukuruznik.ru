{include file="header.tpl"}
{foreach from=$albums item=album}
<script type="text/javascript">
	$(function() {
	    $("#photo_upload").uploadify({
		height        : 30,
		swf           : 'http://{$smarty.server.SERVER_NAME}/js/uploadify/uploadify.swf',
		uploader      : 'http://{$smarty.server.SERVER_NAME}/js/uploadify/uploadify.php?album={$album.codename}',
		width         : 120
	    });
	});
</script>
<a href="http://{$smarty.server.SERVER_NAME}/admin/index.php/galery/album/{$album.codename}">Вернуться в альбом</a>
<br><br>
Загрузить фото в альбом {$album.name}<br>
<input type="file" name="photo_upload" id="photo_upload" />
{/foreach}
{include file="footer.tpl"}
