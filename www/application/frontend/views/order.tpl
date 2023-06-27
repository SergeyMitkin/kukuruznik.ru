{include file="header.tpl"}
{include file="secheader.tpl"}
<script>
	var r = 0; //Булево - есть ли ошибки в заявке
	var fill = 0; //Заполнены ли все поля
	//var sertnum = 0;
	var sertnum = 1;
	var mailcheck = 0; //Верно ли введен email
	var parametrs = 1; //Булево - норм ли пропорции тела
	var n = 1; //Кол-во человек в заявке

	function check_form(){
		r = fill * mailcheck * parametrs * sertnum;
		if(r == 0){
			var alerttext = 'Проверьте правильность введенной информации:\r\n';
			if(fill == 0){ alerttext = alerttext+'   — Проверьте заполнены ли все поля.\r\n'; }
			if(sertnum == 0) { alerttext = alerttext+'   — Введенного вами сертификата не существует \r\n'}
			if(mailcheck == 0) { alerttext = alerttext+'   — Неверно введен email.\r\n';}
			if(parametrs == 0) { alerttext = alerttext+'   — Ваши возраст, вес или рост не подходят для данного типа прыжков.\r\n'; }
			alert(alerttext);
			return false;
		}else{
			return true;
		}
	}

	function form(numb,type){
		return $('<span class="values added">'+
			'<input type="text" placeholder="Ф.И.О. участника №'+numb+'" name="name[]" style="width:40%;">'+
			'<input class="form_age" type="text" placeholder="Возраст" name="age[]">'+
			'<input class="form_weight" type="text" placeholder="Вес" name="weight[]">'+
			'<input class="form_height" type="text" placeholder="Рост" name="height[]">'+
			'<input type="text" placeholder="№ сертификата" class="validatesingle" name="sertnum[]">'+
			'<div class="check_form"><br></div>'+
			'<br>'+
			'</span>');
	}

	function add_human(type,event){
		n++;
		event.preventDefault();	
		form(n,type).fadeIn('slow').appendTo('.inputs_'+type);
	}

	function remove_human(type) {
		if(n > 1) {
			$('SPAN.added:last').remove();
			n--;
		}
	}

	
{literal}
	$('form.single').live('keyup',function() {
		fill = 1;
		$('form.single input').each(function(){
			if($(this).val() == '' && $(this).attr('name') != 'sertnum[]'){
				fill = fill * 0;
			}else{
				fill = fill * 1;
			}
		});
		/*
		if(($('form.single input[name=sertnum[]]').val().length == 6) || ($('form.single input[name=sertnum[]]').val().length == 0)){
			sertnum = 1;
		}
		if(($('form.single input[name=sertnum[]]').val().length != 6) && ($('form.single input[name=sertnum[]]').val().length != 0)){
			sertnum = 0;
		}
		*/
	});

	$('form.tandem').live('keyup',function() {
		fill = 1;
		$('form.tandem input').each(function(){
			if($(this).val() == '' && $(this).attr('name') != 'sertnum[]'){
				fill = fill * 0;
			}else{
				fill = fill * 1;
			}
		});
		/*
		if(($('form.tandem input[name=sertnum[]]').val().length == 6) || ($('form.single input[name=sertnum[]]').val().length == 0)){
			sertnum = 1;
		}
		if(($('form.tandem input[name=sertnum[]]').val().length != 6) && ($('form.single input[name=sertnum[]]').val().length != 0)){
			sertnum = 0;
		}
		*/
	});

	$('SPAN.values').live('keyup',function() {
		var age = parseInt($(this).find('.form_age').val().replace(/\D/g, ''),10)||0;
		var height = parseInt($(this).find('.form_height').val().replace(/\D/g, ''),10)||0;
		var weight = parseInt($(this).find('.form_weight').val().replace(/\D/g, ''),10)||0;
		var heightlen = ($(this).find('.form_height').val().length);
		if((age != 0) && (height != 0) && (heightlen == 3) && (weight != 0)){
			if (($(this).parent().attr("class") == 'order_form single')){
				if ((age >= 15) && (weight >= 48) && (weight <= 95) && ((weight/(height*height/10000)) <= 30)){
					$(this).find('.check_form').text(' ');
					$(this).find('.check_form').css('color','#000');
					parametrs = 1;
				}else{
					$(this).find('.check_form').text('Ваши возраст, вес или рост не подходят для данного типа прыжка!');
					parametrs = 0;
					$(this).find('.check_form').css('color','#ff0000');
				}
			}

			if (($(this).parent().attr("class") == "order_form tandem")){
				if ((age >= 12) && (weight <= 130)){
					$(this).find('.check_form').text(' ');
					$(this).find('.check_form').css('color','#000');
					parametrs = 1;
				}else{
					$(this).find('.check_form').text('Ваши возраст, вес или рост не подходят для данного типа прыжка!');
					parametrs = 0;
					$(this).find('.check_form').css('color','#ff0000');
				}
			}
		}
	});

{/literal}
</script>
<section id="inside">
		<div class="otstup"></div>
		<aside class="title">
			<h1>выберите тип прыжка,</h1>
			<span class="inside">который вам подходит.</span>  
			<a style="padding: 0; background-image:url('../images/button_howchoose.png'); font: italic 12pt Georgia, serif; width:157px; height:31px; color:#fff; text-decoration:none; margin:20px auto; display:block; line-height:29px; text-align:center;" href="https://{$smarty.server.SERVER_NAME}/how_choose.html">Как выбрать</a>
		</aside>
		
<section class="content">
		<table width=100%>
				<tr>
					<td width="50%" valign="top" class="first" align="center">

<!-------------------------------------------->					

					<aside id="one" style="display:block">
						{$info_single.0.content}
					</aside>

<!-------------------------------------------->				
					
					<aside id="one_none" style="display:none">
						<h4>Заявка на самостоятельный прыжок</h4><br>
						<form class="order_form single" action="http://{$smarty.server.SERVER_NAME}/order.html" method="POST">
							<input type="text" placeholder="Фамилия, Имя и Отчество" name="name[]">
							<input type="text" placeholder="Контактный телефон" name="telephone">
							<input type="text" placeholder="Электронная почта" class="validatesingle" name="email"><span id="validEmailsingle"></span>
							<input type="text" placeholder="№ подарочного сертификата (если имеется)" class="validatesingle" name="sertnum[]">
							<br><label>Укажите</label>
							
							<span class="values">
							<div class="single">
								<input class="form_age" type="text" placeholder="Возраст" name="age[]">
								<input class="form_weight" type="text" placeholder="Вес" name="weight[]">
								<input class="form_height" class="height" type="text" placeholder="Рост" name="height[]"> <a onclick="add_human('single',event);return false;" href="#">Добавить еще участника</a>
								<div class="check_form"><br></div>
							</div>
							</span>
							<div class="inputs_single" style="width:100%;"></div>
							<a onclick="remove_human('single');return false;" href="#">Удалить последнего участника</a><br><br>
							<label>Желаемая дата прыжка:</label>
								<select style="width:150px;" name="date">
									{foreach from=$singledates item=singledate}
									<option value="{$singledate.date}">{$singledate.date|date_format:"%d %m %Y":"":"rus"}</option>
									{/foreach}
								</select>
							<br><br>
							<input type="hidden" name="type" value="single">
							<input class="submit" onclick="return check_form();" type="submit" value="полетели">	
						</form>
					</aside>

<!-------------------------------------------->
					</td>

					
					
					<td width="50%" valign="top" align="center">
					
					<aside id="two" style="display:block;">
						{$info_tandem.0.content}
					</aside>
					
					<aside id="two_none" style="display:none;">
					<h4>Заявка на прыжок в тандеме</h4><br>
					<form class="order_form tandem" action="http://{$smarty.server.SERVER_NAME}/order.html" method="POST">
							<input type="text" placeholder="Фамилия, Имя и Отчество" name="name[]">
							<input type="text" placeholder="Контактный телефон" name="telephone">
							<input type="text" placeholder="Электронная почта" class="validatetandem" name="email"><span id="validEmailtandem"></span>
							<input type="text" placeholder="№ подарочного сертификата (если имеется)" class="validatesingle" name="sertnum[]">
						<Br>	
							<span class="values">
								<input class="form_age" type="text" placeholder="Возраст" name="age[]">
								<input class="form_weight" type="text" placeholder="Вес" name="weight[]">
								<input class="form_height" type="text" placeholder="Рост" name="height[]"> <a onclick="add_human('tandem',event);return false;" href="">Добавить еще участника</a>
								<div class="check_form"><br></div>	
							</span>
					
							<div class="inputs_tandem"></div>
							<a onclick="remove_human('tandem');return false;" href="#">Удалить последнего участника</a><br><br>
							<label>Желаемая дата прыжка:</label>
							<select style="width:150px;" name="date">
								{foreach from=$tandemdates item=tandemdate}
								<option value="{$tandemdate.date}">{$tandemdate.date|date_format:"%d %m %Y":"":"rus"}</option>
								{/foreach}
							</select>

							<script>
							{literal}
								function isValidEmailAddress(emailAddress) {
								    var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
								    return pattern.test(emailAddress);
								}
								$(".validatesingle").live('keyup',function(){
									var emailsingle = $(".validatesingle").val();
									if(emailsingle != 0){
										if(isValidEmailAddress(emailsingle)){
											$("#validEmailsingle").css({"background-image": "url('img/validyes.png')"});
											mailcheck = 1;
										}else{				
											$("#validEmailsingle").css({"background-image": "url('img/validno.png')"});
											mailcheck = 0;
										}
									}else{
										$("#validEmailsingle").css({"background-image": "none"}); 
									}
								});
								$(".validatetandem").live('keyup',function(){
									var emailtandem = $(".validatetandem").val();
									if(emailtandem != 0){
										if(isValidEmailAddress(emailtandem)){
											$("#validEmailtandem").css({"background-image": "url('img/validyes.png')"});
											mailcheck = 1;
										}else{				
											$("#validEmailtandem").css({"background-image": "url('img/validno.png')"});
											mailcheck = 0;
										}
									}else{
										$("#validEmailtandem").css({"background-image": "none"}); 
									}
								});
							{/literal}
								{assign var=k value=0}
								{strip}
							</script>
							<br><br>
							<input type="hidden" name="type" value="tandem">
							<input onclick="return check_form();" class="submit" type="submit" value="полетели" name="">
						</form>
						</aside>
					</td>
				</tr>
			</table>
	</section>
</section>
{include file="footer.tpl"}
