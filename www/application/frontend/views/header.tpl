<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8" />
	<!--[if IE]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
	<title>{$title}</title>
	<meta name="keywords" content="{$keywords}" />
	<meta name="description" content="{$description}" />
	<script src="http://code.jquery.com/jquery-1.8.2.js"></script>
	<script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
	<script src="http://{$smarty.server.SERVER_NAME}/js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
	<script src="http://{$smarty.server.SERVER_NAME}/js/share42/share42.js" type="text/javascript"></script>
	<link href="https://{$smarty.server.SERVER_NAME}/favicon.png" rel="icon" type="image/x-icon" />
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
	<link rel="stylesheet" href="http://{$smarty.server.SERVER_NAME}/css/style.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="http://{$smarty.server.SERVER_NAME}/css/prettyPhoto.css" type="text/css" media="screen" charset="utf-8" />
	<link rel="stylesheet" href="http://{$smarty.server.SERVER_NAME}/css/stylesheet.css" type="text/css" charset="utf-8" />
{literal}
<!-- Yandex.Metrika counter -->
<script type="text/javascript">
(function (d, w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter32181604 = new Ya.Metrika({id:32181604,
                    webvisor:true,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true});
        } catch(e) { }
    });

    var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () { n.parentNode.insertBefore(s, n); };
    s.type = "text/javascript";
    s.async = true;
    s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

    if (w.opera == "[object Opera]") {
        d.addEventListener("DOMContentLoaded", f, false);
    } else { f(); }
})(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="//mc.yandex.ru/watch/32181604" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
{/literal}
	<script type="text/javascript">
		$(document).ready(function(){
			$("a[rel^='prettyPhoto']").prettyPhoto();
		});
		function openNews(id) {
			if (document.getElementById(id).style.display == "none"){ 
				document.getElementById(id).style.display = "block";
			} else {
				document.getElementById(id).style.display = "none";
			}
		}	

		function openMenu(block_id) {
			if (block_id=="one_none") {
				document.getElementById("one").style.display = "none"
				document.getElementById("one_none").style.display = "block";
				
				document.getElementById("two").style.display = "block"
				document.getElementById("two_none").style.display = "none";
			} else {

				document.getElementById("one").style.display = "block"
				document.getElementById("one_none").style.display = "none";
				
				document.getElementById("two").style.display = "none"
				document.getElementById("two_none").style.display = "block";
			}
		}
	</script>
	
</head>

<body>

