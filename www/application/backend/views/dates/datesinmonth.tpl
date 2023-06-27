{include file="header.tpl"}
<a href="http://{$smarty.server.SERVER_NAME}/admin/index.php/dates/add_date">Добавить дату</a><br>
<a href="http://{$smarty.server.SERVER_NAME}/admin/index.php/dates/">Вернуться к текущему месяцу</a><br><br>
<table width="100%">
<tr>
<td width="50%">
<h3>Одиночный прыжок:</h3><br><br>
{foreach from=$singledates item=singledate}
{$singledate.date|date_format:"%d %m %Y":"":"rus"} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {$singledate.jumptype} <a href="http://{$smarty.server.SERVER_NAME}/admin/index.php/dates/remove_date/{$singledate.Id}">Удалить</a><br>
{/foreach}
</td>
<td width="50%">
<h3>Прыжок в тандеме:</h3><br><br>
{foreach from=$tandemdates item=tandemdate}
{$tandemdate.date|date_format:"%d %m %Y":"":"rus"} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {$tandemdate.jumptype} <a href="http://{$smarty.server.SERVER_NAME}/admin/index.php/dates/remove_date/{$tandemdate.Id}">Удалить</a><br>
{/foreach}
</td>
</tr>
</table>
<br>
<h3>Показать график работы на другой месяц</h3>
<form action="http://{$smarty.server.SERVER_NAME}/admin/index.php/dates/showdatesinmonth" method="POST">
Год:
<input value="{'Y'|date}" type="text" size="4" name="year" />
Месяц (номер):
<input value="0{'m'|date +1}" type="text" size="2" name="month" />
<input type="submit" />
</form>
{include file="footer.tpl"}
