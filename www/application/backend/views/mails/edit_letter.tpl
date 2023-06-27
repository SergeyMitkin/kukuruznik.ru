{include file="header.tpl"}
{foreach from=$letters item=letter}
<form action="http://{$smarty.server.SERVER_NAME}/admin/index.php/mails/edit_letter/{$letter.Id}" method="POST">
Тема письма: <input type="text" value="{$letter.title}" size="100" name="title" /><br>
<br><textarea id="editor" style= "height:400px;" name="content">{$letter.content}</textarea><br>
Дата отправления письма: <input type="text" name="date" value="{$letter.date}" /><br>
<script>
	$("#editor").kendoEditor({
	    tools: [
		"bold",
		"italic",
		"underline",
		"strikethrough",
		"fontName",
		"fontSize",
		"foreColor",
		"backColor",
		"justifyLeft",
		"justifyCenter",
		"justifyRight",
		"justifyFull",
		"insertUnorderedList",
		"insertOrderedList",
		"indent",
		"outdent",
		"formatBlock",
		"createLink",
		"unlink",
		"insertImage",
		"subscript",
		"superscript",
		"viewHtml"
	    ]
	});
</script>
<input type="submit" value="Сохранить" />
</form>
{/foreach}
{include file="footer.tpl"}
