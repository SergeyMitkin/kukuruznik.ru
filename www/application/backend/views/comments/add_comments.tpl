{include file='header.tpl'}
<form action="http://{$smarty.server.SERVER_NAME}/admin/index.php/comments/add_comments/" method="post" accept-charset="utf-8">
<textarea id="editor" type="text" name="text" size="50" /></textarea>
<script type="text/javascript">
	CKEDITOR.replace( 'editor' );
</script>
<br>
<br>
Дата:
<input type="text" name="date" size="10" />
<br>
<br>
Автор:
<input type="text" name="author" size="10" />
<br>
<br>
Возраст:
<input type="text" name="age" size="2" />
<br>
<br>
<input type="submit" value="Отправить" />
</form>
{include file='footer.tpl'}
