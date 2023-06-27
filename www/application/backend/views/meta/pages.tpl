{include file="header.tpl"}
<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li class="active">Meta-теги</li>
</ul>
<a href="#add_meta" class="btn btn-primary" role="button" data-toggle="modal">Добавить мета-тег</a>
<br><br>
<!--modal-->
<div id="add_meta" class="modal hide fade">
		
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>Создание meta-тега</h3>
	</div>

	<div class="modal-body">
		<form class="form-horizontal" method="POST" action="/admin/meta/add">
			<div class="control-group">
				<label class="control-label">URL</label>
				<div class="controls">
					<input type="text" name="uri" placeholder="URL">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Заголовок</label>
				<div class="controls">
					<input type="text" name="title" placeholder="Title">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Ключевые слова</label>
				<div class="controls">
					<input type="text" name="keywords" placeholder="Keywords">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Описание</label>
				<div class="controls">
					<input type="text" name="description" placeholder="Description">
				</div>
			</div>

			<div class="controls">
				<button class="btn btn-primary" type="submit">Сохранить</button>
			</div>
		</form>
	</div>
</div>
<!--/modal-->
<table class="table">
	<thead>
		<th>Путь</th>
		<th>Заголовок</th>
		<th>Ключевые слова</th>
		<th>Описание</th>
		<th>Действия</th>
	</thead>
	{foreach from=$pages item=page}
	<tr>
		<td>{$page.uri}</td>
		<td>{$page.title}</td>
		<td>{$page.keywords}</td>
		<td>{$page.description}</td>
		<td width="100">
			<a href="#edit{$page.Id}" class="btn btn-primary" role="button" data-toggle="modal"><i class="icon-pencil"></i></a>
			<a href="/admin/meta/delete/{$page.Id}" class="btn btn-danger" role="button" data-toggle="modal"><i class="icon-trash"></i></a>
			<div id="edit{$page.Id}" class="modal hide fade">
					
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3>Редактирование meta-тегов</h3>
				</div>

				<div class="modal-body">
					<form class="form-horizontal" method="POST" action="/admin/meta/edit">
						<div class="control-group">
							<label class="control-label">URL</label>
							<div class="controls">
								<input type="text" name="uri" placeholder="URL" value="{$page.uri}">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">Заголовок</label>
							<div class="controls">
								<input type="text" name="title" placeholder="Title" value="{$page.title}">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">Ключевые слова</label>
							<div class="controls">
								<input type="text" name="keywords" placeholder="Keywords" value="{$page.keywords}">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">Описание</label>
							<div class="controls">
								<input type="text" name="description" placeholder="Description" value="{$page.description}">
							</div>
						</div>

						<div class="controls">
							<button class="btn btn-primary" type="submit">Сохранить</button>
						</div>
					</form>
				</div>
			</div>
		</td>
	</tr>
	{/foreach}
</table>
{include file="footer.tpl"}
