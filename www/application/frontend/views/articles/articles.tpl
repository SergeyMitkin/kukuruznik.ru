{include file="header.tpl"}
{include file="secheader.tpl"}
	<section id="inside">
		<div class="otstup"></div>
		<aside class="title">
			<h1>Статьи</h1>
		</aside>

		<section class="content">
			<div class="content">
				{foreach from=$articles item=article}
					<div class="articles">
						<h2><i><b><a href="http://{$smarty.server.SERVER_NAME}/articles/view/{$article.Id}">{$article.title}</a></b></i></h2><br>
						<span>{$article.shorttext} <a href="/articles/view/{$article.Id}">Читать далее</a></span>
						<br><br>
					</div>
				{/foreach}
				<div class="">{$pages}</div>
			</div>
		</section>
	</section>
{include file="footer.tpl"}
