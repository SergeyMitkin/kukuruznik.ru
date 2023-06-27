{include file="header.tpl"}
<script>
	jQuery(function($){
		 $("[name='date']").mask("9999-99-99");
	});
</script>
<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li class="active">Список новостей</li>
</ul>
<a href="#add_new" class="btn btn-primary" role="button" data-toggle="modal">Добавить новость</a>
<br><br>
<!--modal-->
<div id="add_new" class="modal modal-big hide fade">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>Создать новость</h3>
	</div>
	<div class="modal-body">
		<form class="form-horizontal" method="POST" action="/admin/news/add_new">
			<div class="control-group">
				<label class="control-label">Заголовок</label>
				<div class="controls">
					<input type="text" name="title" placeholder="Заголовок">
				</div>
			</div> 

			<textarea id="editor_new" name="text"></textarea>
			<script type="text/javascript">
				CKEDITOR.replace( 'editor_new' );
			</script>
			<br>

			<div class="control-group">
				<label class="control-label">Дата</label>
				<div class="controls">
					<input type="text" name="date" placeholder="Дата">
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
		<th>Дата</th>
		<th>Заголовок</th>
		<th>Управление</th>
	</thead>
	{foreach from=$news item=new}
	<tr>
		<td>{$new.date|date_format:"%d %m %y":"":"rus"}</td>
		<td>{$new.title}</td>
		<td>
			<a href="#edit{$new.Id}" role="button" data-toggle="modal" class="btn btn-primary">Редактировать</a> <a href="/admin/news/delete_new/{$new.Id}" class="btn btn-danger" onclick="confirmDelete();">Удалить</a>
			<div id="edit{$new.Id}" class="modal modal-big hide fade">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3>Редактировать новость</h3>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="POST" action="/admin/news/edit_new/{$new.Id}">
						<div class="control-group">
							<label class="control-label">Заголовок</label>
							<div class="controls">
								<input type="text" name="title" placeholder="Заголовок" value="{$new.title}">
							</div>
						</div>
						<div class="control-group">
							<textarea id="editor{$new.Id}" name="text">{$new.text}</textarea>
							<script type="text/javascript">
								CKEDITOR.replace( 'editor{$new.Id}' );
							</script>
						</div>
						<div class="control-group">
							<label class="control-label">Дата</label>
							<div class="controls">
								<input type="text" name="date" placeholder="Дата" value="{$new.date}">
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
