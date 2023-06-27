{include file="header.tpl"}
<script>

function num2month(num) {
	var month = ['января','февраля','марта','апреля','мая','июня',
	'июля','августа','сентября','октября','ноября','декабря'];
	return month[num-1];
}

jQuery(function($){
	$("[name='date']").mask("9999-99-99");

	$("#add_date").delegate(":input", "change", function(){
		if($("#add_date select[name='jumptype']").val() == 'single') { 
			$("#add_date input[name='title']").val("Прыжки с парашютом "+$("#add_date input[name='date']").val().substr(8,2)+" "+num2month(parseInt($("#add_date input[name='date']").val().substr(5,2))));
		}

		if($("#add_date select[name='jumptype']").val() == 'tandem') { 
			$("#add_date input[name='title']").val("Прыжки с парашютом в тандеме "+$("#add_date input[name='date']").val().substr(8,2)+" "+num2month(parseInt($("#add_date input[name='date']").val().substr(5,2))));
		}
	});
});
</script>
<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li class="active">Список дат</li>
</ul>
<a href="#add_date" class="btn btn-primary" role="button" data-toggle="modal">Создать дату</a>
<br><br>
<div id="add_date" class="modal hide fade">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>Создать дату</h3>
	</div>

	<div class="modal-body">
		<form class="form-horizontal" method="POST" action="/admin/dates/add_date">
			<div class="control-group">
				<label class="control-label">Дата</label>
				<div class="controls">
					<input type="text" name="date" placeholder="Дата">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Тип прыжка</label>
				<div class="controls">
					<select name="jumptype">
						<option value="single">Одиночный</option>
						<option value="tandem">Тандем</option>
					</select>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Заголовок письма</label>
				<div class="controls">
					<input type="text" name="title" placeholder="Заголовок письма">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Шаблон текста письма</label>
				<div class="controls">
					<select name="template">
						{foreach from=$templates item=template}
						<option value="{$template.id}">{$template.title}</option>
						{/foreach}
					</select>
				</div>
			</div>

			<div class="controls">
				<button class="btn btn-primary" type="submit">Создать</button>
			</div>
		</form>
	</div>
</div>
<table class="table">
	<thead>
		<th>Дата</th>
		<th>Тип прыжка</th>
		<th>Файл</th>
	</thead>
	{foreach from=$dates item=date}
	<tr>
		<td>{$date.date|date_format:"%d %m %y":"":"rus"}</td>
		<td>{if $date.single === TRUE}<a href="/admin/orders/ondate/{$date.date}/single" class="btn btn-primary">Одиночный</a> <a onclick="return confirm('Вы уверены, что хотите удалить эту запись?') ? true : false;" class="btn btn-danger" href="/admin/dates/delete_date/{$date.date}/single"><i class="icon-trash"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;{/if}{if $date.tandem === TRUE}<a href="/admin/orders/ondate/{$date.date}/tandem" class="btn btn-primary">Тандем</a> <a class="btn btn-danger" href="/admin/dates/delete_date/{$date.date}/tandem"><i class="icon-trash"></i></a>{/if}</td>
		<td>{if $date.single === TRUE}<a href="/welcome/csv?date={$date.date}&type=single" class="btn"><i class="icon-file"></i>Одиночный</a>{/if}{if $date.tandem === TRUE} <a href="/welcome/csv?date={$date.date}&type=tandem" class="btn"><i class="icon-file"></i>Тандем</a>{/if}</td>
	</tr>
	{/foreach}

</table>
{include file="footer.tpl"}
