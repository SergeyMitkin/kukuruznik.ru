{include file="header.tpl"}
<ul class="breadcrumb">
	<li><a href="/admin/">Главная</a> <span class="divider">/</span></li>
	<li><a href="/admin/groups">Группы пользователей</a> <span class="divider">/</span></li>
	<li class="active">Редактирование группы</li>
</ul>
    <form action="/admin/groups/edit/{$group.Id}" method="POST">
        <input name="name" type="text" placeholder="Имя группы" value="{$group.name}"><br>
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
                <td><input type="checkbox" name="rights[{$module.controller}][read]" {if isset($module.rights.read)}checked=checked{/if}></td>
                <td><input type="checkbox" name="rights[{$module.controller}][write]" {if isset($module.rights.write)}checked=checked{/if}></td>
                <td><input type="checkbox" name="rights[{$module.controller}][delete]" {if isset($module.rights.delete)}checked=checked{/if}></td>
            </tr>
            {/foreach}
        </table>
        <br><br>
        <input type="submit" value="Сохранить">
    </form>
{include file="footer.tpl"}
