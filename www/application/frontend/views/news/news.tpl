{include file="header.tpl"}
{include file="secheader.tpl"}
	<section id="inside">
		<div class="otstup"></div>
		<aside class="title">
			<h1>Новости</h1>
		</aside>

		<section class="content">
			<div class="content">
				{foreach from=$news item=new}
					<div class="articles">
						<h2><i><b><a href="http://{$smarty.server.SERVER_NAME}/news/view/{$new.Id}">{$new.title}</a></b></i></h2><br>
						<span>{$new.shorttext} <a href="/news/view/{$new.Id}">Читать далее</a></span>
						<br><br>
					</div>
				{/foreach}
				<div class="">{$pages}</div>
			</div>
		</section>
	</section>
{include file="footer.tpl"}
