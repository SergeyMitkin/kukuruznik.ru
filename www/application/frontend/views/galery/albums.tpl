{include file="header.tpl"}
{include file="secheader.tpl"}
<section id="inside">
	<div class="otstup"></div>
		<aside class="title">
			<h1>Фотогалерея</h1>
			<span class="inside">Выберите альбом</span>  
		</aside>
		
	<section class="content">
		{foreach from=$albums item=album}
			<a style="float:left; margin: 15px;" href="http://{$smarty.server.SERVER_NAME}/album/{$album.codename}"><img src="http://{$smarty.server.SERVER_NAME}/image.php?height=150&width:300&cropratio=2:1&image=/galery/photos/{$album.codename}/{$album.cover}" /><br>{$album.name}</a>
		{/foreach}
	</section>
</section>
{include file="footer.tpl"}
