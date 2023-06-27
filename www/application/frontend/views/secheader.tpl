<div id="news" class="bg_massage" style="display:none;">
	<div class="massage">
		<div class="close">
			<a onclick="openNews('news');return(false)"  href="">	<img src="http://{$smarty.server.SERVER_NAME}/images/close.gif"></a>
		</div>
			{foreach from=$dates item=date}
		Ближайшие прыжки с парашютом:<br><br> На круглых куполах: <b>{if $date.single.0 == 'Неизвестно'}Неизвестно{else}{$date.single.0|date_format:"%d %m":"":"rus"}{/if}</b> (<i>подготовка состоится {if $date.single.1 == 'Неизвестно'}Неизвестно{else}{$date.single.1|date_format:"%d %m":"":"rus"}{/if}</i>) <br><br> Прыжки с парашютом в тандеме: <b>{if $date.tandem.0 == 'Неизвестно'}Неизвестно{else}{$date.tandem.0|date_format:"%d %m":"":"rus"}{/if} и {if $date.tandem.1 == 'Неизвестно'}Неизвестно{else}{$date.tandem.1|date_format:"%d %m":"":"rus"}{/if}</b> - далее каждые выходные
		<br>
		<a href="http://{$smarty.server.SERVER_NAME}/date">Посмотреть все ближайшие даты прыжков</a>
			{/foreach}
	</div>
</div>

<header id="header_inside">
	<aside class="logo_inside">
		<a href="http://{$smarty.server.SERVER_NAME}"><img src="http://{$smarty.server.SERVER_NAME}/images/logo_inside.jpg"></a>
	</aside>
	<nav>
		<ul class="menu_inside">
			<li><a href="http://{$smarty.server.SERVER_NAME}/info.html">информация</a></li>
			<li class="left"><a href="http://{$smarty.server.SERVER_NAME}/faq.html">F.A.Q.</a></li>
			<li class="left"><a href="http://{$smarty.server.SERVER_NAME}/galery.html">галерея</a></li>
			<li class="right"><a href="http://{$smarty.server.SERVER_NAME}/order.html">подать заявку</a></li>
			<li><a href="http://{$smarty.server.SERVER_NAME}/price.html">цены</a></li>
			<li><a href="http://{$smarty.server.SERVER_NAME}/contacts.html">контакты</a></li>
		</ul>
	<script type="text/javascript">
		$("ul.menu_inside li").each(function(){
		 if($(this).find("a").attr('href') == window.location.href){
			$(this).addClass("active");
			$(this).find("a").attr("class","active");
		 }
		});

		$(".active a").click(function(event){
			event.preventDefault();
		});
	</script>
	<aside class="news">
 		<a onclick="openNews('news');return(false)" href="">Ближайшие прыжки</a>
	</aside>
		<aside class="main">
			<a href="http://{$smarty.server.SERVER_NAME}">На главную</a>
		</aside>
	
	</nav>
</header>	
