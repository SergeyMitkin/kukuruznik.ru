{include file="header.tpl"}
<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li class="active">Список шаблонов</li>
</ul>
<a href="#add_temp" class="btn btn-primary" role="button" data-toggle="modal">Создать шаблон</a>
<br><br>
<!--modal-->
<div id="add_temp" class="modal modal-big hide fade">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>Создать шаблон</h3>
	</div>
	<div class="modal-body">
		<form class="form-horizontal" method="POST" action="/admin/lettemps/add_template">
			<div class="control-group">
				<label class="control-label">Заголовок</label>
				<div class="controls">
					<input type="text" name="title" placeholder="Заголовок">
				</div>
			</div> 

			<textarea id="editor_lettemp" name="text"></textarea>
			<script type="text/javascript">
				CKEDITOR.replace( 'editor_lettemp' );
			</script>
			<br>
			<div class="control-group">
				<label class="control-label">Файл</label>
				<div class="controls">
					<select name="attached">
						{foreach from=$files item=file}
							<option value="{$file.name}">{$file.name}</option>
						{/foreach}
					</select>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<button class="btn btn-primary" type="submit">Создать</button>
				</div>
			</div>
		</form>
	</div>
</div>
<!--/modal-->
<table class="table">
	<thead>
		<th>Заголовок</th>
		<th>Управление</th>
	</thead>
	{foreach from=$templates item=template}
	<tr>
		<td>{$template.title}</td>
		<td>
			<a href="#edit{$template.id}" role="button" data-toggle="modal" class="btn btn-primary">Редактировать</a> <a href="/admin/lettemps/delete_template/{$template.id}" class="btn btn-danger" onclick="confirmDelete();">Удалить</a>
			<div id="edit{$template.id}" class="modal modal-big hide fade">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3>Редактировать шаблон</h3>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="POST" action="/admin/lettemps/edit_template/{$template.id}">
						<div class="control-group">
							<label class="control-label">Заголовок</label>
							<div class="controls">
								<input type="text" name="title" placeholder="Заголовок" value="{$template.title}">
							</div>
						</div>
						<div class="control-group">
							<textarea id="editor{$template.id}" name="text">{$template.text}</textarea>
							<script type="text/javascript">
								CKEDITOR.replace( 'editor{$template.id}' );
							</script>
						</div>
						<div class="control-group">
							<label class="control-label">Файл</label>
							<div class="controls">
								<select name="attached">
									<option value=""></option>
									{foreach from=$files item=file}
										<option {if $file.name == $template.attached}selected{/if} value="{$file.name}">{$file.name}</option>
									{/foreach}
								</select>
							</div>
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
