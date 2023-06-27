{include file="header.tpl"}
{include file="secheader.tpl"}
	<section id="inside">
		<div class="otstup"></div>
			<aside class="title">
				<h1>{$new.title}</h1>
			</aside>

			<section class="content">
				<div class="content">
						<div>
							<a href="http://{$smarty.server.SERVER_NAME}/news">Ко всем новостям</a><br><br>
							{$new.text}
						</div>
				</div>
			</section>
	</section>
{include file="footer.tpl"}
