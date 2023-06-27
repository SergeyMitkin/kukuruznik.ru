{include file="header.tpl"}
{include file="secheader.tpl"}
	<section id="inside">
		<div class="otstup"></div>
			<aside class="title">
				<h1>Заявка отправлена</h1>
				<span class="inside">Ознакомьтесь с информацией ниже</span>  
			</aside>
			
		<section class="content">
			<div style="width:100%; text-align:center; font-size:18px;">
			{if $overinterval == 1}
				Ваша заявка на прыжок с парашютом принята. <br><br>

				За 5-6 дней до прыжков на Вашу электронную почту придет подробная  инструкция  о дальнейших действиях и схема проезда.
				<br><br>
				Если за 5 дней до запланированной даты прыжков  Вы не получите наше письмо, то:
				<br><br>
				1. Проверьте, не попало ли подтверждающее письмо в папку "Нежелательная почта", "Спам" или в "Корзину" (этим часто грешит почта от gmail.com)
				<br><br>
				2. Если письма нет в указанных в п.1 папках, то свяжитесь с нами по эл. почте jump@kukuruznik.com, <br> или по тел. +7 926 824 64 59 
			{else}
				Ваша заявка принята, проверьте Вашу эл. почту<br>
				Если вы не полчили наше письмо, то:
				<br><br>
				1. Проверьте, не попало ли подтверждающее письмо в папку "Нежелательная почта", "Спам" или в "Корзину" (этим часто грешит почта от gmail.com)
				<br><br>
				2. Если письма нет в указанных в п.1 папках, то свяжитесь с нами по эл. почте jump@kukuruznik.com, или по тел. +7 926 824 64 59 
			{/if}
			</div>
		</section>
	</section>
{include file="footer.tpl"}
