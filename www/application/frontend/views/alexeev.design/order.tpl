{include file='header.tpl'}
<script>
$(document).ready(function(){

    var i = $('input').size() + 1;

    $('#add').click(function() {
		$('<tr class="field">'+
			'<td><input type="text" name="name[]" size="50" /></td>'+
			'<td><input type="text" name="age[]" size="5" /></td>'+
			'<td><input type="text" name="weight[]" size="3" /></td>'+
			'<td><input type="text" name="height[]" size="3" /></td>'+
			'</tr>').fadeIn('slow').appendTo('.inputs');
		i++;
    });

    $('#remove').click(function() {
    if(i > 1) {
        $('.field:last').remove();
        i--;
    }
    });

    return false;
});

</script>
<div class="container_12 page content">
<div class="grid_12">
<h3 class="title">Заявка на прыжок с парашютом</h3><br />

{validation_errors()}

{form_open('order')}
<table>
    <thead id="form">
        <tr>
            <td>ФИО</td>
            <td>Возраст</td>
            <td>Вес</td>
            <td>Рост</td>
        </tr>
    </thead>
    <tbody class="inputs">
        <tr class="field">
            <td><input type="text" name="name[]" value="{set_value('name')}" size="50" /></td>
            <td><input type="text" name="age[]" value="{set_value('age')}" size="5" /></td>
            <td><input type="text" name="weight[]" value="{set_value('weight')}" size="3" /></td>
            <td><input type="text" name="height[]" value="{set_value('height')}" size="3" /></td>
        </tr>
    </tbody>
</table>

<a href="#" id="add">Добавить</a>&nbsp;<a href="#" id="remove">Удалить</a><br /><br />

Тип прыжка:
<input type="radio" name="type" value="single" onchange="single()" {set_radio('type', 'single', TRUE)} />Одиночный 
<input type="radio" name="type" value="tandem" onclick="tandem()" {set_radio('type', 'tandem')} />Тандем
<br>
<br>

Телефон:
+7 <input type="text" name="telephone" value="{set_value('telephone')}" size="12" />
<br>
<br>

Email:
<input type="text" name="email" value="{set_value('email')}" size="20" />
<br>
<br>

Дата:
<input type="text" id="datepicker" name="date" value="{set_value('date')}" size="10" />
<script>
	var date = new Date();
	var activatedtandemDays = [
	{assign var=k value=0}
	{assign var=l value=0}
	{foreach from=$tandemdates item=tandemdate}
		"{$tandemdate.date}"
		{if $k++ < $tandemdates|@count-1}
		,
		{/if}
	{/foreach}
	];
	var activatedsingleDays = [
	{foreach from=$singledates item=singledate}
		"{$singledate.date}"
		{if $l++ < $singledates|@count-1}
		,
		{/if}
	{/foreach}
	];
	function tandem(){
		$( "#datepicker" ).datepicker( "destroy" );
		var activatedDays = activatedtandemDays;
		$( "#datepicker" ).datepicker();
		$( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
		$( "#datepicker" ).datepicker( "option", "beforeShowDay", activateAllTheseDays );
	}
	
	function single(){
		$( "#datepicker" ).datepicker( "destroy" );
		var activatedDays = activatedsingleDays;
		$( "#datepicker" ).datepicker();
		$( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
		$( "#datepicker" ).datepicker( "option", "beforeShowDay", activateAllTheseDays );
	}
	var activatedDays = activatedsingleDays;
	function activateAllTheseDays(date) {
		var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
		for (i = 0; i < activatedDays.length; i++) {
			if($.inArray(y + '-' + (m+1) + '-' + d,activatedDays) != -1) {
				return [true];
			}
		}
		return [false];
	}
	$( "#datepicker" ).datepicker();
	$( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
	$( "#datepicker" ).datepicker( "option", "beforeShowDay", activateAllTheseDays );
</script> 
<br>
<br>
<input type="submit" value="Отправить" />

</form>
</div>
</div>
{include file='footer.tpl'}