{include file="header.tpl"}
{include file="secheader.tpl"}
{foreach from=$info item=infos}
<section id="inside">
	<div class="otstup"></div>
	
	<aside class="title">
		<!--h1>Здоровье</h1-->
		<h1 class="submenu">{$infos.title}</h1>
		<span class="inside"></span>  
	</aside>
		
	<section class="content_with_submenu">
		{include file="submenu.tpl"}	
			<aside class="content_submenu">
				{$infos.text}
			</aside>			
	</section>
</section>
{/foreach}
{include file="footer.tpl"}
