{include file="header.tpl"}
<form action="http://{$smarty.server.SERVER_NAME}/admin/index.php/dates/add_date" method="POST">
<input id="datepicker" type="text" name="date" />
<script type="text/javascript">
	$(function() {
		$("#datepicker").datepicker();
		$("#datepicker").datepicker("option","dateFormat","yy-mm-dd");
	});
</script>
<select name="jumptype">
	<option value="single">Одиночный</option>
	<option value="tandem">Тандем</option>
</select>
<input type="submit" />
</form>
{include file="footer.tpl"}
