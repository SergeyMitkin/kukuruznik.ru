{include file="header.tpl"}
{include file="secheader.tpl"}
	<section id="inside">
		<div class="otstup"></div>
			<aside class="title">
				<h1 class="submenu">{$article.title}</h1>
			</aside>

			<section class="content">
				<div class="content">
						<div>
							<a href="http://{$smarty.server.SERVER_NAME}/articles">Ко всем статьям</a><br><br>
							{$article.text}
						</div>
				</div>
			</section>
	</section>
{include file="footer.tpl"}
