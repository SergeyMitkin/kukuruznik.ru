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
<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li><a href="/admin/galery/">Галерея</a> <span class="divider">/</span></li>
	<li><a href="/admin/galery/albums">Фотоальбомы</a> <span class="divider">/</span></li>
	<li class="active">{$album.name}</li>
</ul>
<a href="#upload" class="btn btn-primary" role="button" data-toggle="modal">Загрузить фото</a>
<div id="upload" class="modal hide fade">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>Загрузить фото</h3>
	</div>
	<div class="modal-body">
		<input type="file" name="photo_upload" id="photo_upload" />
		<a href="/admin/galery/album/{$album.codename}" class="btn btn-primary">Закрыть</a>
	</div>
</div>
<br><br>
<ul class="thumbnails">
	{foreach from=$photos item=photo}
	<li class="span3"> 
		<a class="quickbox thumbnail" href="/galery/photos/{$album.codename}/{$photo.path}">
			<img src="/image.php?height=100&width=260&height=160&cropratio=1.5:1&image=/galery/photos/{$album.codename}/{$photo.path}" />
		</a>
		<br>
		<a href="/admin/galery/album_cover/{$photo.album}/{$photo.Id}" class="btn btn-mini">Обложка</a>&nbsp;<a href="/admin/galery/remove_photo/{$photo.Id}" class="btn btn-danger btn-mini" onclick="return confirm('Вы уверены, что хотите удалить эту запись?') ? true : false;">Удалить</a>
		
	</li>
	{/foreach}
</ul>
{/foreach}
{include file="footer.tpl"}
