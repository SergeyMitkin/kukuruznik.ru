{include file="header.tpl"}
<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li class="active">Настройки</li>
</ul>
<a href="#add" class="btn btn-primary" role="button" data-toggle="modal">Создать параметр</a><br><br>
<div id="add" class="modal modal-big hide fade">

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>Создать параметр</h3>
	</div>

	<div class="modal-body">
		<form class="form-horizontal" method="POST" action="/admin/configs/add/">
			<div class="control-group">
				<label class="control-label">Имя</label>
				<div class="controls">
					<input type="text" name="name" placeholder="Имя">
				</div>
			</div>

			<div class="control-group">
				<textarea id="editor_new" name="value"></textarea>
				<script type="text/javascript">
					CKEDITOR.replace( 'editor_new' );
				</script>
			</div>

			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-primary">Сохранить</button>
				</div>
			</div>
		</form>
	</div>
</div>
<table class="table">
	<thead>
		<th>Имя</th>
		<th>Действия</th>
	</thead>
{foreach from=$configs item=config}

	<tr>
		<td>{$config.name}</td>
		<td>
			<a href="#edit{$config.Id}" class="btn btn-primary" role="button" data-toggle="modal">Редактировать</a>
			<a href="/admin/configs/delete/{$config.Id}" class="btn btn-danger" onclick="return confirm('Вы уверены, что хотите удалить эту запись?') ? true : false;">Удалить</a>
			<div id="edit{$config.Id}" class="modal modal-big hide fade">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3>Редактировать параметр</h3>
				</div>

				<div class="modal-body">
					<form class="form-horizontal" method="POST" action="/admin/configs/edit/{$config.Id}">
						<div class="control-group">
							<label class="control-label">Имя</label>
							<div class="controls">
								<input type="text" name="name" placeholder="Имя" value="{$config.name}">
							</div>
						</div>

						<div class="control-group">
							<textarea id="editor{$config.Id}" name="value">{$config.value}</textarea>
							<script type="text/javascript">
								CKEDITOR.replace( 'editor{$config.Id}' );
							</script>
						</div>

						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn btn-primary">Сохранить</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</td>
	</tr>

{/foreach}
</table>
{include file="footer.tpl"}
