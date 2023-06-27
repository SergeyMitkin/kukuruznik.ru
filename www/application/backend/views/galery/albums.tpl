{include file="header.tpl"}
<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li class="active">Страницы</li>
</ul>
<a href="#add" class="btn btn-primary" role="button" data-toggle="modal">Добавить альбом</a>

<div id="add" class="modal hide fade">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>Создать альбом</h3>
	</div>
	<div class="modal-body">
		<form class="form-horizontal" action="/admin/galery/add_album" method="POST">
			<div class="control-group">
				<label class="control-label">Имя альбома</label>
				<div class="controls">
					<input type="text" name="name" placeholder="Имя">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Кодовое имя</label>
				<div class="controls">
					<input type="text" name="codename" placeholder="codename">
				</div>
			</div>

			<div class="control=group">
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
	<th>Имя альбома</th>
	<th>Действия</th>
</thead>
{foreach from=$albums item=album}
	<tr>
		<td>
			<a href="/admin/galery/album/{$album.codename}" class="btn btn-primary">{$album.name}</a> <a class="btn btn-danger" href="/admin/galery/remove_album/{$album.codename}" onclick="return confirm('Вы уверены, что хотите удалить эту запись?') ? true : false;"><i class="icon-trash"></i></a>
		</td>
		<td>
			<a href="#edit{$album.Id}" class="btn btn-primary" role="button" data-toggle="modal">Переименовать</a>
			<div id="edit{$album.Id}" class="modal hide fade">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3>Переименовать альбом</h3>
				</div>

				<div class="modal-body">
					<form class="form-horizontal" action="/admin/galery/edit_album/{$album.Id}" method="POST">
						<div class="control-group">
							<label class="control-label">Имя альбома</label>
							<div class="controls">
								<input type="text" name="name" placeholder="Имя" value="{$album.name}">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">Кодовое имя</label>
							<div class="controls">
								<input type="text" name="codename" placeholder="codename" value="{$album.codename}">
							</div>
						</div>

						<div class="control=group">
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
{include file="footer.tpl"}
