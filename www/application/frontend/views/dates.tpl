{include file="header.tpl"}
{include file="secheader.tpl"}
<section id="inside">
	<div class="otstup"></div>
	
	<aside class="title">
		<h1 class="submenu">График прыжков</h1>
		<span class="inside"></span>  
	</aside>
		
	<section class="content">
			<aside class="content">
				<table width="100%">
				<tr>
				<td width="50%" class="first">
				<span style="font: 25px/25px intro_inlineregular,sans-serif;">Самостоятельные прыжки:</span>
				<br><br>
				{foreach from=$singledates item=singledate}
				{$singledate.date|date_format:"%d %m %Y":"":"rus"}<br>
				{/foreach}
				</td>
				<td width="50%">
				<span style="font: 25px/25px intro_inlineregular,sans-serif;">Прыжки в тандеме:</span>
				<br><br>
				{foreach from=$tandemdates item=tandemdate}
				{$tandemdate.date|date_format:"%d %m %Y":"":"rus"}<br>
				{/foreach}
				</td>
				</tr>
				</table>
			</aside>			
	</section>
</section>
{include file="footer.tpl"}
