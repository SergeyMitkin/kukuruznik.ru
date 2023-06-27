{include file="header.tpl"}
<script>
jQuery(function($){
   $("[name='date']").mask("9999-99-99");
});
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
	<li class="active">Список рассылок</li>
</ul>
<table class="table">
	<thead>
		<th>Дата</th>
		<th>Заголовок</th>
		<th>Управление</th>
	</thead>
	{foreach from=$letters item=letter}
	<tr>
		<td>{$letter.date|date_format:"%d %m %y":"":"rus"}</td>
		<td>{$letter.title}</td>
		<td>
			<a href="#edit{$letter.Id}" role="button" data-toggle="modal" class="btn btn-primary">Редактировать</a> <a href="/admin/mails/remove_letter/{$letter.Id}" class="btn btn-danger" onclick="confirmDelete();">Удалить</a>
			<div id="edit{$letter.Id}" class="modal modal-big hide fade">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3>Редактировать заявку</h3>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="POST" action="/admin/mails/edit_letter/{$letter.Id}">
						<div class="control-group">
							<label class="control-label">Заголовок</label>
							<div class="controls">
								<input type="text" name="title" placeholder="Заголовок" value="{$letter.title}">
							</div>
						</div>
						<div class="control-group">
							<textarea id="editor{$letter.Id}" name="content">{$letter.content}</textarea>
							<script type="text/javascript">
								CKEDITOR.replace( 'editor{$letter.Id}' );
							</script>
						</div>
						<div class="control-group">
							<label class="control-label">Дата отправления</label>
							<div class="controls">
								<input type="text" name="date" placeholder="Дата" value="{$letter.date}">
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
