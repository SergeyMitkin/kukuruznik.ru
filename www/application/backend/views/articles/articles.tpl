{include file="header.tpl"}
<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li class="active">Список статей</li>
</ul>
<a href="#add_article" class="btn btn-primary" role="button" data-toggle="modal">Добавить статью</a>
<br><br>
<!--modal-->
<div id="add_article" class="modal modal-big hide fade">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>Создать статью</h3>
	</div>
	<div class="modal-body">
		<form class="form-horizontal" method="POST" action="/admin/articles/add_article">
			<div class="control-group">
				<label class="control-label">Заголовок</label>
				<div class="controls">
					<input type="text" name="title" placeholder="Заголовок">
				</div>
			</div> 

			<textarea id="editor_article" name="text"></textarea>
			<script type="text/javascript">
				CKEDITOR.replace( 'editor_article' );
			</script>

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
	{foreach from=$articles item=article}
	<tr>
		<td>{$article.title}</td>
		<td>
			<a href="#edit{$article.Id}" role="button" data-toggle="modal" class="btn btn-primary">Редактировать</a> <a href="/admin/articles/delete_article/{$article.Id}" class="btn btn-danger" onclick="confirmDelete();">Удалить</a>
			<div id="edit{$article.Id}" class="modal modal-big hide fade">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3>Редактировать новость</h3>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="POST" action="/admin/articles/edit_article/{$article.Id}">
						<div class="control-group">
							<label class="control-label">Заголовок</label>
							<div class="controls">
								<input type="text" name="title" placeholder="Заголовок" value="{$article.title}">
							</div>
						</div>
						<div class="control-group">
							<textarea id="editor{$article.Id}" name="text">{$article.text}</textarea>
							<script type="text/javascript">
								CKEDITOR.replace( 'editor{$article.Id}' );
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
