{include file='header.tpl'}
<script>
jQuery(function($){
   $("[name='date']").mask("9999-99-99");
});
</script>
<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li class="active">Список рассылок</li>
</ul>
<a href="#add" class="btn btn-primary" role="button" data-toggle="modal">Создать отзыв</a>

<div id="add" class="modal modal-big hide fade">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>Создать отзыва</h3>
	</div>
	<div class="modal-body">
		<form class="form-horizontal" method="POST" action="/admin/comments/add_comments">
			<div class="control-group">
				<label class="control-label">Дата</label>
				<div class="controls">
					<input type="text" name="date" placeholder="Дата">
				</div>
			</div>
				
			<div class="control-group">
				<label class="control-label">Автор</label>
				<div class="controls">
					<input type="text" name="author" placeholder="Автор">
				</div>
			</div>
			
			<div class="control-group">
				<textarea name="text" id="editor_new"></textarea>
				<script type="text/javascript">
						CKEDITOR.replace( 'editor_new' );
				</script>
			</div>
			<div class="control-group">
				<div class="controls">
					<button type="submit" class="btn btn-primary">Создать</button>
				</div>
			</div>
		</form>
	</div>
</div>

<br><br>
    <table class="table">
	    <thead>
		    <th>Дата</th>
		    <th>Автор</th>
	    </thead>
	    {foreach from=$comments item=comment}
	    <tr>
		<td>{$comment.date|date_format:"%d %m %y":"":"rus"}</td>
		<td>{$comment.author}</td>
		<td>
			<a href="#edit{$comment.date}" class="btn btn-primary" role="button" data-toggle="modal">Редактировать</a>
			<a href="/admin/comments/delete_comments/{$comment.Id}" class="btn btn-danger" onclick="return confirm('Вы уверены, что хотите удалить эту запись?') ? true : false;">Удалить</a>
			<div id="edit{$comment.date}" class="modal modal-big hide fade">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3>Редактирование отзыва</h3>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="POST" action="/admin/comments/edit_comments/{$comment.Id}">
						<div class="control-group">
							<label class="control-label">Дата</label>
							<div class="controls">
								<input type="text" name="date" placeholder="Дата" value="{$comment.date}">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label">Автор</label>
							<div class="controls">
								<input type="text" name="author" placeholder="Автор" value="{$comment.author}">
							</div>
						</div>

						<div class="control-group">
							<textarea name="text" id="editor{$comment.Id}">{$comment.text}</textarea>
							<script type="text/javascript">
								CKEDITOR.replace( 'editor{$comment.Id}' );
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
	    {/foreach}
    </table>
 
{include file='footer.tpl'}
