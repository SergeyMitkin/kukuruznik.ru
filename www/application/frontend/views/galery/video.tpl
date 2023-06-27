{include file="header.tpl"}
{include file="secheader.tpl"}
<section id="inside">
{foreach from=$videos item=video}	
	<div class="otstup"></div>
	<aside class="title">
		<h1>{$video.title}</h1>
		<span class="inside"></span>  
	</aside>
	<section class="content">
		{$video.code}
	</section>
{/foreach}
</section>
{include file="footer.tpl"}
