{include file='header.tpl'}

<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li class="active">Страницы</li>
</ul>
    <table class="table">
	<thead>
		<th>Заголовок</th>
		<th>Действия</th>
	</thead>

	{foreach from=$pages item=page}
	<tr>
		<td>{$page.title}</td>

		<td>
			<a href="#edit{$page.Id}" role="button" data-toggle="modal" class="btn btn-primary">Редактировать</a>
			<div id="edit{$page.Id}" class="modal modal-big hide fade">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3>Редактировать страницу</h3>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="POST" action="/admin/pages/edit_page/{$page.Id}">
						<div class="control-group">
							<textarea id="editor{$page.Id}" style="width:100%; height:400px;" name="content">{$page.content}</textarea>
						</div>
						<div class="control-group">
							<button type="submit" class="btn btn-primary">Сохранить</button>
						</div>
					</form>
				</div>
			</div>
		</td>
	</tr>
    {/foreach}
    </table>
{include file='footer.tpl'}
