{include file="header.tpl"}
<form action="http://{$smarty.server.SERVER_NAME}/admin/index.php/mails/add_letter" method="POST">
Тема письма: <input type="text" size="100" name="title" /><br>
<br><textarea id="editor" name="content"></textarea><br>
Дата отправления письма: <input type="text" name="date" id="datepicker" /><br>
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
{include file="footer.tpl"}
