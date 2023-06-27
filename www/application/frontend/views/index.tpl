{include file="header.tpl"}
<header id="header">
		<nav>
			<ul class="menu">
				<li><a href="http://{$smarty.server.SERVER_NAME}/info.html">информация</a></li>
				<li><a href="http://{$smarty.server.SERVER_NAME}/faq.html">F.A.Q.</a></li>
				<li><a href="http://{$smarty.server.SERVER_NAME}/galery.html">галерея</a></li>
				<li><a href="http://{$smarty.server.SERVER_NAME}/order.html">подать заявку</a></li>
				<li><a href="http://{$smarty.server.SERVER_NAME}/price.html">цены</a></li>
				<li><a href="http://{$smarty.server.SERVER_NAME}/contacts.html">контакты</a></li>	
			</ul>
		</nav>
</header>	

<section id="wrapper">
		<section id="content">
			
			<article id="sideRightAdv">
				<a href="https://adrenaline-zone.com/" class="advbanner"><img src="/img/Layer-5.gif"></a>
			</article>

			<aside class="logo">
				<img src="https://{$smarty.server.SERVER_NAME}/images/logo.png">
			</aside>

			<article id="sideLeft">
				<b>Последние новости:</b><br><br>

				{foreach from=$news item=new}
					<h4><a href="/news/view/{$new.Id}">{$new.title}</a></h4><br>
					{$new.shorttext}
					<br>
				{/foreach}

				<br>
				<a href="http://{$smarty.server.SERVER_NAME}/news">Посмотреть все новости</a>
			</article>
			
			<aside class="slogan">
				прыжки с парашютом<br>в Москве
				<span><h1 style="display:inline; font: 14px/18px intro_regular,sans-serif;">школа начинающего парашютиста</h1></span>
			</aside>
			
			<aside class="fly">
				ну что,	
				<a href="#inside">полетаем?</a>
			</aside>

			<article id="sideRight">
			{foreach from=$dates item=date}
		Ближайшие прыжки с парашютом:<br><br> 
На круглых куполах: 
<b>{if $date.single.0 == 'Неизвестно'}Неизвестно{else}{$date.single.0|date_format:"%d %m":"":"rus"}{/if}</b> и <b> {if $date.single.1 == 'Неизвестно'}Неизвестно{else}{$date.single.1|date_format:"%d %m":"":"rus"}{/if}</b> - далее каждые выходные <br><br> Прыжки с парашютом в тандеме: <b>{if $date.tandem.0 == 'Неизвестно'}Неизвестно{else}{$date.tandem.0|date_format:"%d %m":"":"rus"}{/if} и {if $date.tandem.1 == 'Неизвестно'}Неизвестно{else}{$date.tandem.1|date_format:"%d %m":"":"rus"}{/if}</b> - далее каждые выходные
		<br>
		<a href="http://{$smarty.server.SERVER_NAME}/date">Посмотреть все ближайшие даты прыжков</a>
			{/foreach}
			</article>
		</section>
</section><!-- #wrapper -->


<div id="bg">
	<div id="bg_px"></div>
	<img src="images/bg.jpg" alt="">
</div>	

<section id="inside">
	<aside class="title">
		<a name="inside">«Испытай один раз полет,<br> и твои глаза будут навечно<br> устремлены в небо»
		<span>Леонардо да Винчи</span> </a> 
	</aside>
	
	<aside class="content">
		{$content.0.content}
	</aside>
</section>
{include file="footer.tpl"}
