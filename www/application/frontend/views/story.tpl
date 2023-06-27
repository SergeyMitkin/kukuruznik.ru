{include file="header.tpl"}
{include file="secheader.tpl"}
	<section id="inside">
		<div class="otstup"></div>
			<aside class="title">
				<h1 class="submenu">Рассказы перворазников</h1>
			</aside>

			<section class="content_with_submenu">
				{include file="submenu.tpl"}
				<aside class="content_submenu">
					{foreach from=$stories item=story}
						<div>
							<a href="http://{$smarty.server.SERVER_NAME}/story.html">Ко всем рассказам</a><br><br>
							<img src="http://{$smarty.server.SERVER_NAME}/images/calendar.gif" /> {$story.date|date_format:"%d %m %Y":"":"rus"}<br>
							<i><b>{$story.author}</b>, {$story.age} года</i><br>
							{$story.text}
						</div>
					{/foreach}
				</aside>
			</section>
	</section>
{include file="footer.tpl"}
