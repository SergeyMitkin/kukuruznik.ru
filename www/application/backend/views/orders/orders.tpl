{include file='header.tpl'}
<style>
	.sended {
		color:#120873;
	}

	.cancel {
		color:#ff0000;
	}

	.readed {
		color:#ff46f9;
	}

	.checked {
		color:#00bf32;
	}
</style>
<script>
		var j;
    function add(id) {
			$('<tr class="field'+id+'">'+
				'<td><input type="text" name="name[]" size="50" /></td>'+
				'<td><input type="text" name="age[]" style="width:18px;" size="5" /></td>'+
				'<td><input type="text" name="weight[]" style="width:18px;" size="3" /></td>'+
				'<td><input type="text" name="height[]" style="width:25px;" size="3" /></td>'+
				'<td><input type="text" name="sertnum[]" style="width:60px;" size="3" /></td>'+
				'</tr>').fadeIn('slow').appendTo('.inputs'+id);
    }

    function remove_ins(id) {
				//j = $('.inputs'+id+' .field'+id).size();
				$('.field'+id).remove();
		}

		jQuery(function($){
			 $("[name='date']").mask("9999-99-99");
		});



</script>
<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li><a href="/admin/orders/">Список дат</a> <span class="divider">/</span></li>
	<li class="active">{$date.date|date_format:"%d %m %y":"":"rus"}</li>
</ul>

<h3>Перенести все заявки на другую дату</h3>
<form class="form-vertical" action="/admin/orders/changedate/{$date.date}/{$date.type}" method="POST">
		<input type="text" name="date" placeholder="Новая дата">
		<button style="margin-bottom:10px;" class="btn btn-primary" type="submit">Перенести</button>
</form>

<table class="table">
	<thead>
		{if $write}
			<th>ФИО</th>
		{/if}
		{if $delete}
			<th>Телефон</th>
			<th>E-mail</th>
			<th>Люди</th>
			<th>Кол-во серт.</th>
			<th>Заметки</th>
			<th>Цвета</th>
			<th>Действия</th>
		{/if}
	</thead>
	{foreach from=$orders item=order}
	
	<tr class="{$order.confirmation}">
		{if $write}
			<td>{$order.name}</td>
		{/if}
		{if $delete}
			<td>{$order.telephone}</td>
			<td>{$order.email}</td>
			<td>{$order.count_people}</td>
			<td>{$order.sert_size}</td>
			<td>{$order.notes}</td>
			<td>
				<div class="btn-group">
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">Цвет<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/admin/orders/set_confirm/{$order.Id}/sended" style="margin-bottom:5px;">Синий</a>
		</li>
						<li><a href="/admin/orders/set_confirm/{$order.Id}/checked" style="margin-bottom:5px;">Зеленый</a>
		</li>
						<li><a href="/admin/orders/set_confirm/{$order.Id}/cancel" style="margin-bottom:5px;">Красный</a>
		</li>
						<li><a href="/admin/orders/set_confirm/{$order.Id}/readed" style="margin-bottom:5px;">Фиолетовый</a>
		</li>
						<li><a href="/admin/orders/set_confirm/{$order.Id}/NULL">Черный</a></li>
					</ul>
				</div>
			</td>
			<td>		
				<a href="#edit{$order.Id}" role="button" data-toggle="modal" class="btn btn-small btn-primary" style="margin-bottom:5px;">Редактировать</a>
				<br>
				<a href="#people{$order.Id}" role="button" data-toggle="modal" class="btn btn-small btn-primary" style="margin-bottom:5px;">Люди</a>
				<br>
				<a href="/admin/orders/delete_order/{$order.Id}" class="btn btn-small btn-danger" onclick="return confirm('Вы уверены, что хотите удалить эту запись?') ? true : false;">Удалить</a>

				<div id="edit{$order.Id}" class="modal hide fade">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3>Редактировать заявку</h3>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" method="POST" action="/admin/orders/edit_order/{$order.Id}/{$order.date}/{$order.type}">
							<div class="control-group">
								<label class="control-label">Дата</label>
								<div class="controls">
									<input type="text" name="date" placeholder="Дата" value="{$order.date}">
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">Тип прыжка</label>
								<div class="controls">
									<select name="type">
										<option {if $order.type == 'single'}selected="selected"{/if} value="single">Одиночный</option>
										<option {if $order.type == 'tandem'}selected="selected"{/if} value="tandem">Тандем</option>
									</select>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">Телефон</label>
								<div class="controls">
									<input type="text" name="telephone" placeholder="Телефон" value="{$order.telephone}">
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">Эл. почта</label>
								<div class="controls">
									<input type="text" name="email" placeholder="E-mail" value="{$order.email}">
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">Заметки</label>
								<div class="controls">
									<textarea name="notes">{$order.notes}</textarea>
								</div>
							</div>

							<div class="controls">
								<button class="btn btn-primary" type="submit">Сохранить</button>
							</div>
						</form>
					</div>
				</div>

				<div id="people{$order.Id}" class="people modal hide fade">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3>Редактировать состав</h3>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" method="POST" action="/admin/orders/people/{$order.Id}/{$order.date}/{$order.type}">
							<div class="control-group">
								<table>
									 <thead id="form">
											<tr>
													<td>ФИО</td>
													<td>Возраст</td>
													<td>Вес</td>
													<td>Рост</td>
													<td>Сертификат</td>
											</tr>
									 </thead>
									 <tbody class="inputs{$order.Id}">
										{assign var="g" value=1}
										{foreach from=$order.people item=man}
											<tr class="field{$order.Id}{$g} fields">
													<td><input type="text" name="name[]" value="{$man.name}" size="50" /></td>
													<td><input type="text" name="age[]" style="width:18px;" value="{$man.age}" size="5" /></td>
													<td><input type="text" name="weight[]" style="width:18px;" value="{$man.weight}" size="3" /></td>
													<td><input type="text" name="height[]" style="width:25px;" value="{$man.height}" size="3" /></td>
													<td><input type="text" name="sertnum[]" style="width:60px;" value="{$man.sertnum}" /></td>
													<td><a href="#" onclick="remove_ins({$order.Id}{$g});" class="btn btn-danger"><i class="icon-trash"></i></a></td>
											</tr>
										{$g = $g + 1}
										{/foreach}
									 </tbody>
								</table>
							</div>

							<div class="controls">
								<a href="#" class="btn btn-primary" onclick="add({$order.Id})">Добавить</a>
								<br><br>
								<button class="btn btn-primary" type="submit">Сохранить</button>
							</div>
						</form>
					</div>
				</div>
			</td>
		{/if}
	</tr>
	{/foreach}

</table>
{include file='footer.tpl'}
