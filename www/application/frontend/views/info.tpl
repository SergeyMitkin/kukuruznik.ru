{include file="header.tpl"}
{include file="secheader.tpl"}
{foreach from=$info item=infos}
	<section id="inside">
		<div class="otstup"></div>
			<aside class="title">
				<h1>{$infos.title}</h1>
				<span class="inside">{$infos.inside}</span>  
			</aside>
			
		<section class="content">
			{$infos.text}
		</section>
	</section>
{/foreach}
{include file="footer.tpl"}
