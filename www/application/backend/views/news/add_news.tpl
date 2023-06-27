{include file='header.tpl'}
<form action="http://kukuruznik.tk/admin/index.php/news/add_news/" method="post" accept-charset="utf-8">
Текст:
<input type="text" name="text" size="50" />
<br>
<br>
Дата (в формате год-месяц-день):
<input type="text" name="date" size="10" />
<br>
<br>
<input type="submit" value="Отправить" />
</form>
{include file='footer.tpl'}