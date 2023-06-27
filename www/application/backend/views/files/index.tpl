{include file='header.tpl'}
<script>
	function confirmDelete() {
		if(confirm("Вы уверены, что хотите удалить этот файл?")){
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

<form enctype="multipart/form-data" method="POST" action="/admin/files/upload_file">
	<div class="control-group">
		<label class="control-label">Файл</label>
		<div class="controls">
			<input type="file" name="file">
			<button type="submit" class="btn btn-primary">Загрузить</button>
		</div>
</form>
<br><br>

<table class="table">
	<thead>
		<th>Файл</th>
		<th>Действия</th>
	</thead>

	{foreach from=$files item=file}
	<tr>
		<td><a href="/uploads/{$file.name}">{$file.name}</a></td>
		<td>
			<a href="/admin/files/delete_file/{$file.id}" class="btn btn-danger" onclick="confirmDelete();">Удалить</a>
		</td>
	</tr>
	{/foreach}
</table>

{include file='footer.tpl'}
