{include file="header.tpl"}
<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li><a href="/admin/galery">Галерея</a> <span class="divider">/</span></li>
	<li class="active">Видео</li>
</ul>
<a href="#add" class="btn btn-primary" role="button" data-toggle="modal">Добавить видео</a><br><br>
<div id="add" class="modal hide fade">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>Добавить видео</h3>
	</div>

	<div class="modal-body">
		<form class="form-horizontal" action="/admin/galery/add_video" method="POST">
			<div class="control-group">
				<label class="control-label">Заголовок видео</label>
				<div class="controls">
					<input type="text" name="title" placeholder="Заголовок">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Код вставки</label>
				<div class="controls">
					<textarea name="code"></textarea>
				</div>
			</div>

			<div class="control-group">
				<div class="controls">
					<button class="btn btn-primary" type="submit">Добавить</button>
				</div>
			</div>
		</form>
	</div>
</div>
<table class="table">
	<thead>
		<th>Заголовок</th>
		<th>Действия</th>
	</thead>
{foreach from=$videos item=video}
	<tr>
		<td>{$video.title}</td>
		<td>
			<a href="#edit{$video.Id}" class="btn btn-primary" role="button" data-toggle="modal">Редактировать</a>
			<div id="edit{$video.Id}" class="modal hide fade">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3>Редактировать видео</h3>
				</div>

				<div class="modal-body">
					<form class="form-horizontal" action="/admin/galery/edit_video/{$video.Id}" method="POST">
						<div class="control-group">
							<label class="control-label">Заголовок видео</label>
							<div class="controls">
								<input type="text" name="title" placeholder="Заголовок" value="{$video.title}">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">Код вставки</label>
							<div class="controls">
								<textarea name="code">{$video.code}</textarea>
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<button class="btn btn-primary" type="submit">Сохранить</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<a href="/admin/galery/remove_video/{$video.Id}" class="btn btn-danger" onclick="return confirm('Вы уверены, что хотите удалить эту запись?') ? true : false;">Удалить</a>
		</td>
	</tr>
{/foreach}
{include file="footer.tpl"}
