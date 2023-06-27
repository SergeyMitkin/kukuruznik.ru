{include file='header.tpl'}
{foreach from=$infos item=info}
<form action="http://{$smarty.server.SERVER_NAME}/admin/index.php/infos/edit_info/{$info.codename}" method="post" accept-charset="utf-8">
Текст:
<textarea id="editor" type="text" name="text" size="50" />{$info.text}</textarea>
<script type="text/javascript">
	CKEDITOR.replace( 'editor' );
</script>
<input type="submit" value="Отправить" />
</form>
{/foreach}
{include file='footer.tpl'}
