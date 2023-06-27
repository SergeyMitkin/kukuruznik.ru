<nav class="submenu">
<div><img src="http://{$smarty.server.SERVER_NAME}/images/sub_top.png"></div>			
<ul id="submenu">
	<li><a href="http://{$smarty.server.SERVER_NAME}/photo.html">фото</a></li>
	<li><a href="http://{$smarty.server.SERVER_NAME}/video.html">видео</a></li>
</ul>
<script type="text/javascript">
	$("#submenu li").each(function(){
	 if($(this).find("a").attr('href') == window.location.href){
		$(this).addClass("active");
		$(this).find("a").attr("class","active");
	 }
	});

	$(".active a").click(function(event){
		event.preventDefault();
	});
</script>
<div style="clear:both"><img src="http://{$smarty.server.SERVER_NAME}/images/sub_bottom.png"></div>
</nav>
