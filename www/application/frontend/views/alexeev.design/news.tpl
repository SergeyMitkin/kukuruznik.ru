{include file="header.tpl"}
<div class="container_12 page content">
<div class="grid_12">
<h3 class="title">Новости</h3>
{foreach from=$news item=new}
<span class="date" style="color:#4b79bb;">{$new.date}</span> {$new.text}<br />
{/foreach}
</div>
</div>
{include file="footer.tpl"}