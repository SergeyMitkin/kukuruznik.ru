{include file="header.tpl"}
{include file="secheader.tpl"}
<section id="inside">
	<div class="otstup"></div>
	<aside class="title">
		<h1>Видеогалерея</h1>
		<span class="inside">Здесь вы увидите видео с наших прыжков</span>  
	</aside>
	<section class="content">
		{foreach from=$videos item=video}	
		<a href="http://{$smarty.server.SERVER_NAME}/galery/video/{$video.Id}">{$video.title}</a><br>
		{/foreach}
	</section>
</section>
{include file="footer.tpl"}
