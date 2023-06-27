{include file='header.tpl'}
{foreach from=$news item=new}
<form action="http://kukuruznik.tk/admin/index.php/news/edit_news/{$new.Id}" method="post" accept-charset="utf-8">
Текст:
<input type="text" name="text" value="{$new.text}" size="50" />
<br>
<br>
Дата:
<input type="text" name="date" value="{$new.date}" size="10" />
<br>
<br>
<input type="submit" value="Отправить" />
</form>
{/foreach}
{include file='footer.tpl'}