{include file="header.tpl"}

<div class="container_12 page content">
    <div class="grid_12">
    	{foreach from=$info item=infos}
    	<a href="http://{$smarty.server.SERVER_NAME}/">Главная</a> → <a href="http://{$smarty.server.SERVER_NAME}/info.html">Информация</a> → {$infos.title}  
    	
        <h3 class="title">{$infos.title}</h3><br />
		{$infos.text}    
        {/foreach}
	</div>
</div>
{include file="footer.tpl"}