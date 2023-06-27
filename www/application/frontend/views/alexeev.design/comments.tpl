{include file="header.tpl"}
<div class="container_12 page content">
<div class="grid_12">
<h3 class="title">Отзывы</h3>
<div class="text65">
    {foreach from=$comments item=comm}
    «{$comm.text}» <span class="author">{$comm.author}</span><br>
    {/foreach}
</div>
</div>
</div>
{include file="footer.tpl"}