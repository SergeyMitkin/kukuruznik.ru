{include file='header.tpl'}
{foreach from=$comments item=comment}
<form action="http://{$smarty.server.SERVER_NAME}/admin/index.php/comments/edit_comments/{$comment.Id}" method="post" accept-charset="utf-8">
Текст:
<input id="editor" type="text" name="text" value="{$comment.text}" size="50" />
<script type="text/javascript">
	CKEDITOR.replace( 'editor' );
</script>
<br>
<br>
Дата:
<input type="text" name="date" value="{$comment.date}" size="10" />
<br>
<br>
Автор:
<input type="text" name="author" value="{$comment.author}" size="10" />
<br>
<br>
Возраст:
<input type="text" name="age" value="{$comment.age}" size="2" />
<br>
<br>
<input type="submit" value="Отправить" />
</form>
{/foreach}
{include file='footer.tpl'}
