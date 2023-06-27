{include file='header.tpl'}
<script>
	function confirmDelete() {
		if(confirm("Вы уверены, что хотите удалить эту запись?")){

			return TRUE;
		}else{
			return FALSE;
		}
	}
</script>
<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li class="active">Список страниц</li>
</ul>
<a href="#add_info" class="btn btn-primary" role="button" data-toggle="modal">Создать страницу</a>
	<div id="add_info" class="modal modal-big hide fade">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3>Создать страницу</h3>
		</div>
		<div class="modal-body">
			<form class="form-horizontal" method="POST" action="/admin/infos/add_info">
				<div class="control-group">
					<label class="control-label">Заголовок</label>
					<div class="controls">
						<input type="text" name="title" placeholder="Заголовок">
					</div>
				</div> 

				<div class="control-group">
					<label class="control-label">Кодовое название</label>
					<div class="controls">
						<input type="text" name="codename" placeholder="Codename">
					</div>
				</div> 

				<textarea id="editor_new" name="text"></textarea>
				<script type="text/javascript">
					CKEDITOR.replace( 'editor_new' );
				</script>

				<div class="control-group">
					<div class="controls">
						<button class="btn btn-primary" type="submit">Создать</button>
					</div>
				</div>
			</form>
		</div>
	</div>
<br><br>
<table class="table">
	<thead>
		<th>Заголовок</th>
		<th>Действия</th>
	</thead>

	{foreach from=$infos item=info}
	<tr>
		<td>{$info.title}</td>

		<td>
			<a href="#edit{$info.Id}" class="btn btn-primary" role="button" data-toggle="modal">Редактировать</a>
			<a href="/admin/infos/delete_info/{$info.codename}" class="btn btn-danger" onclick="confirmDelete();">Удалить</a>

			<div id="edit{$info.Id}" class="modal modal-big hide fade">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3>Изменить текст страницы</h3>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="POST" action="/admin/infos/edit_info/{$info.codename}">
						<div class="control-group">
							<label class="control-label">Заголовок</label>
							<div class="controls">
								<input type="text" name="title" placeholder="Заголовок" value="{$info.title}">
							</div>
						</div> 

						<div class="control-group">
							<label class="control-label">Кодовое название</label>
							<div class="controls">
								<input type="text" name="codename" placeholder="Codename" value="{$info.codename}">
							</div>
						</div> 

						<textarea id="editor{$info.Id}" name="text">{$info.text}</textarea>
						<script type="text/javascript">
							CKEDITOR.replace( 'editor{$info.Id}' );
						</script>

						<div class="control-group">
							<div class="controls">
								<button class="btn btn-primary" type="submit">Сохранить</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</td>
	</tr>
	{/foreach}
</table>

{include file='footer.tpl'}
