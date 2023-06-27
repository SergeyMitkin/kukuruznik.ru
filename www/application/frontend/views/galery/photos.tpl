{include file="header.tpl"}
{include file="secheader.tpl"}
<section id="inside">
	<div class="otstup"></div>
{foreach from=$albums item=album}
		<aside class="title">
			<h1>{$album.name}</h1>
			<span class="inside"></span>  
		</aside>
		
	<section class="content">
		<a href="http://{$smarty.server.SERVER_NAME}/photo.html">Вернуться к альбомам</a>
		<br><br>
		{foreach from=$photos item=photo}
		<a title="{$photo.comment}" rel="prettyPhoto" href="http://{$smarty.server.SERVER_NAME}/galery/photos/{$album.codename}/{$photo.path}">
		<img src="http://{$smarty.server.SERVER_NAME}/image.php?height=100&width:150&cropratio=1.5:1&image=/galery/photos/{$album.codename}/{$photo.path}" />
		</a>
		{/foreach}
	</section>
{/foreach}
</section>
{include file="footer.tpl"}
