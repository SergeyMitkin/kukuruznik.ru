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
    {foreach from=$people item=man}
        <tr class="field">
            <td><input type="text" name="name[]" value="{$man.name}" size="50" /></td>
            <td><input type="text" name="age[]" value="{$man.age}" size="5" /></td>
            <td><input type="text" name="weight[]" value="{$man.weight}" size="3" /></td>
            <td><input type="text" name="height[]" value="{$man.height}" size="3" /></td>
        </tr>
	{/foreach}
    </tbody>
</table>

<a href="#" id="add">Добавить</a>&nbsp;<a href="#" id="remove">Удалить</a><br /><br />

<input type="submit" value="Отправить" />

</form>
</div>
</div>
{include file='footer.tpl'}