{include file='header.tpl'}
{foreach from=$orders item=order}
<form action="http://{$smarty.server.SERVER_NAME}/admin/index.php/orders/edit_order/{$order.Id}" method="post" accept-charset="utf-8">
Тип прыжка:
<input type="radio" name="type" value="single" {if $order.type == 'single'}checked{/if} />Одиночный 
<input type="radio" name="type" value="tandem" {if $order.type == 'tandem'}checked{/if} />Тандем
<br>
<br>
Дата:
<input type="text" name="date" value="{$order.date}" id="datepicker" size="10" />
<script type="text/javascript">
	$(function() {
		$("#datepicker").datepicker({
			dateFormat: 'yy-mm-dd',
			defaultDate:'{$order.date}'
		});
	});
</script>
<br>
<br>
<textarea name="notes">{$order.notes}</textarea>
<br>
<input type="submit" value="Отправить" />
</form>
{/foreach}
{include file='footer.tpl'}
