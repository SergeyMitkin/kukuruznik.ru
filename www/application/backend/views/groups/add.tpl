{include file="header.tpl"}
<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li><a href="/admin/groups">Группы пользователей</a> <span class="divider">/</span></li>
	<li class="active">Создание группы</li>
</ul>
    <form action="/admin/groups/add" method="POST">
        <input name="name" type="text" placeholder="Имя группы"><br>
        <b>Права:</b><br>
        R - чтение (просмотр) <br>
        W - запись (создание, редактирование) <br>
        D - удаление <br>
        <table>
            <th>
                <td>R</td>
                <td>W</td>
                <td>D</td>
            </th>
            {foreach from=$modules item=module}
            <tr>
                <td class="group_name">{$module.name}</td>
                <td><input type="checkbox" name="rights[{$module.controller}][read]"></td>
                <td><input type="checkbox" name="rights[{$module.controller}][write]"></td>
                <td><input type="checkbox" name="rights[{$module.controller}][delete]"></td>
            </tr>
            {/foreach}
        </table>
        <br><br>
        <input type="submit" value="Сохранить">
    </form>
{include file="footer.tpl"}
