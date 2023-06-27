/**
* quickBox: author Nazar Tokar
* www.dedushka.org/tag/quickbox
* Copyright 2012-2013
**/

function imgShow(url, ttl, crnt) {
	$("#sshow_imgs a").removeClass("sshow_act");
	$("a[rel='"+crnt+"']").addClass("sshow_act");	
	img = new Image();
	img.src = url;
	
	$(img).load(function(){
		imgLoaded(url, ttl);
		img_width = img.width + 30;
		img_height = img.height + 70;		
		var nx_x = (($(window).width()) - img_width)/2;		
		$("#sshow_img").attr("rel", crnt);		
		$("#sshow").animate({marginLeft:nx_x, width: img_width},300);
		$("#sshow").css("height", img_height);
	});
}

function imgLoaded(url, ttl) {
	$("#sshow_img").fadeOut("fast", function(){
		$('#sshow_img').html('<img src="'+url+'">');
		$('#sshow_img').fadeIn('fast');
	});	
	if (ttl) {
		$('#sshow_dscr p').html(ttl);
	} else {
		$('#sshow_dscr p').html("&nbsp;");
	}
}

$(document).ready(function(){

$(document).on("click", "#sshow_img img", function(){ //click on img
	$("#sshow_right").click(); 
});

//click on a pic

$(document).on("click", "a.quickbox", function(){
	window.scrollTo(0, 0);
	$('<div>', {id: 'sshow_overlay'}).prependTo('body');
	$('<div>', {id: 'sshow'}).prependTo('body');
	$('<div>', {id: 'sshow_wrap'}).appendTo('#sshow');
	$('<div>', {id: 'sshow_art'}).appendTo('#sshow_wrap');
	$('<div>', {id: 'sshow_top'}).appendTo('#sshow_art');
	$('<div>', {id: 'sshow_close', 'class': 'sshow_ani', html:'<u>Закрыть</u> (Esc)'}).appendTo('#sshow_top');
	$('<div>', {id: 'sshow_imglist', html:'<p>Изображения</p>'}).appendTo('#sshow_top');
	$('<div>', {id: 'sshow_imgs'}).appendTo('#sshow_imglist');
	$('<div>', {id: 'sshow_inside'}).appendTo('#sshow_art');
	$('<div>', {id: 'sshow_dscr', html: '<p> </p>'}).appendTo('#sshow_art');
	$('<div>', {id: 'sshow_img', rel: '0'}).appendTo('#sshow_inside');
	$('<div>', {id: 'sshow_right', 'class': 'sshow_ani', html:'&rarr;'}).appendTo('#sshow_dscr');
	$('<div>', {id: 'sshow_ct', text:'Листать'}).appendTo('#sshow_dscr');
	$('<div>', {id: 'sshow_left', 'class': 'sshow_ani', html:'&larr;'}).appendTo('#sshow_dscr');

	$("#sshow_overlay").fadeIn("slow");
	
	var url = $(this).attr("href");
	var ttl = $(this).attr("title");

	ss_url = [];
	ss_ttl = [];
	
	$("a.quickbox").each(function() { //building menu
		ss_url.push($(this).attr('href'));
		ss_ttl.push($(this).attr('title'));
	});
	
	if (ss_url.length > 1) {
	
	for (i in ss_url) { //creating links in menu
		var ii = parseInt(i)+1;
		$('<a>',  {href: ss_url[i], rel: i, 'class': 'sshow_ani', title: ss_ttl[i], html: ii}).appendTo("#sshow_imgs");
	}} else {
		$("#sshow_imgs").html("&nbsp;");
		$("#sshow_imglist").html("&nbsp;");
		$("#sshow_right").remove();
		$("#sshow_left").remove();
		$("#sshow_ct").remove();
	}
	
	var crnt = jQuery.inArray(url, ss_url);
	imgShow(url, ttl, crnt);
	return false;
});

//link next

$(document).on("click", "#sshow_right", function(){
	var crnt = parseInt( $("#sshow_img").attr("rel") );
	var max = ss_url.length-1;	
	if (crnt < max) { 
		nxt = crnt + 1; 
	} else { 
		nxt = 0; 
	}
	imgShow(ss_url[nxt], ss_ttl[nxt], nxt);
	return false;
});

//link previous

$(document).on("click", "#sshow_left", function(){
	var crnt = parseInt( $("#sshow_img").attr("rel") );
	var max = ss_url.length-1;	
	if (crnt != 0) { 
		nxt = crnt - 1; 
	} else { 
		nxt = max; 
	}
	imgShow(ss_url[nxt], ss_ttl[nxt], nxt);
	return false;
});

//href click in images menu

$(document).on("click", "#sshow_imgs a", function(){
	var url = $(this).attr("href");
	var ttl = $(this).attr("title");
	var crnt= $(this).attr("rel");
	imgShow(url, ttl, crnt);
	return false;
});

//remove everything

$(document).on("click", "#sshow_overlay", function(){
	$("#sshow").fadeOut("fast", function(){
		$(this).remove();
	});	
	
	$("#sshow_overlay").fadeOut("slow", function(){
		$(this).remove();
	});
});

//close click

$(document).on("click", "#sshow_close", function(){ 
	$("#sshow_overlay").click(); 
});

// transparency animation

$(document).on("mouseover", ".sshow_ani", function(){
	$('.sshow_ani').each(function(){
		$(this).mouseover(function(){
			$(this).stop().animate({opacity:'0.5'},120);
		}).mouseout(function(){
			$(this).stop().animate({opacity:'1.0'},120);
		});
	});		
});
});

$(document).keydown(function(e) { // navigate
	if ($("#sshow_overlay").is(":visible")){
		if (e.keyCode == 37) { //left
			$("#sshow_left").click();
		}
	if (e.keyCode == 39) { //right
			$("#sshow_right").click();
		}
	if (e.keyCode == 27) { //esc
			$("#sshow_overlay").click(); 
		}
	}
});