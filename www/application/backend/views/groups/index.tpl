{include file="header.tpl"}
<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li class="active">Группы пользователей</li>
</ul>
<a href="/admin/groups/add" class="btn btn-primary">Добавить</a><br><br>
<table class="table">
	<thead>
		<th>Имя группы</th>
		<th>Управление</th>
	</thead>
	{foreach from=$groups item=group}
	<tr>
		<td>{$group.name}</td>
		<td>
			<a href="/admin/groups/edit/{$group.Id}" class="btn btn-primary">Редактировать</a> <a href="/admin/groups/delete/{$group.Id}" class="btn btn-danger" onclick="confirmDelete();">Удалить</a>
		</td>
	</tr>
	{/foreach}
</table>
{include file="footer.tpl"}
