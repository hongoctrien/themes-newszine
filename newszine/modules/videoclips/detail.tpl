<!-- BEGIN: main -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&appId=522660817855744&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<div class="message" id="mesHide"></div>
    <div class="detailContent clearfix">
        <div class="videoTitle" id="videoTitle">{DETAILCONTENT.title}</div>
		<div class="fb-like" data-href="{SELFURL}" data-layout="standard" data-action="like" data-show-faces="false" data-share="true"></div>
        <div class="videoplayer">
            <div class="cont"><div id="videoCont"></div></div>
        </div>
        <div class="clearfix"></div>
    </div>
<script type="text/javascript">
$(function() {
  videoPlay("{DETAILCONTENT.filepath}", "videoCont"), $("html,body").animate({scrollTop:$(".detailContent").offset().top}, 500)
});
</script>
    <div id="otherClipsAj">
        <div class="videoInfo marginbottom15 clearfix">
            <div class="cont">
                <div class="hometext">
                    {DETAILCONTENT.hometext}
                    <!-- BEGIN: bodytext -->
                    <div class="bodytext hide">{DETAILCONTENT.bodytext}</div>
                    <div class="bodybutton"><a href="open" class="bodybutton">{LANG.moreContent}</a></div>
                    <!-- END: bodytext -->
                </div>
            </div>
        </div>
	<!-- BEGIN: comment -->
        <iframe src="{NV_COMM_URL}" id = "fcomment" onload = "nv_setIframeHeight( this.id )" style="width: 100%; min-height: 300px; max-height: 1000px"></iframe>
	<!-- END: comment -->
<script type="text/javascript">
function addLikeImage(){var b=intval($("#ilike").text()),c=intval($("#iunlike").text()),d=$(".image").width();if(0==b&&0==c)$(".image").removeClass("imageunlike").addClass("image0"),$("#imglike").removeClass("like").width(1),$("#plike,#punlike").text("");else if($(".image").removeClass("image0").addClass("imageunlike"),0==b)$("#imglike").removeClass("like").width(1),$("#plike").text("0%"),$("#punlike").text("100%");else{var a=intval(100*b/(b+c)),b=intval(a*(d/100)),e=100-a;$("#imglike").addClass("like").animate({width:b},
1500,function(){$("#plike").text(a+"%");$("#punlike").text(e+"%")})}}$(function(){addLikeImage()});
$("a.likeButton").click(function(){var b=$(this).attr("href"),c=$("img",this).attr("class"),d=$(this).offset();$.ajax({type:"POST",url:b,data:"aj="+c,success:function(a){if("access forbidden"==a)return alert("{LANG.accessForbidden}"),!1;var a=a.split("_"),b="like"==a[0]||"unlike"==a[0]?"{LANG.thank}":"{LANG.thankBroken}";$("#i"+a[0]).text(a[1]);addLikeImage();$("#mesHide").text(b).css({left:d.left+50+"px",top:d.top-100+"px","z-index":1E4}).show("slow");setTimeout(function(){$("div#mesHide").css({"z-index":"-1"}).hide("slow")},
3E3)}});return!1});$("a.bodybutton").click(function(){"open"==$(this).attr("href")?($(".bodytext").slideDown("slow"),$(this).attr("href","close").text("{LANG.collapseContent}"),$("html,body").animate({scrollTop:$(".hometext").offset().top},500)):($(".bodytext").slideUp("slow"),$(this).attr("href","open").text("{LANG.moreContent}"),$("html,body").animate({scrollTop:$(".detailContent").offset().top},500));return!1});
</script>

<div id="main" class="row-fluid galleries">
	<header class="entry-header">
		<h1 class="entry-title"><span>{LANG.new_e}</span></h1>
	</header>
	
	<!-- BEGIN: otherClips -->
	<!-- BEGIN: row4 -->
	<div class="row-fluid gallery-row">
		<!-- BEGIN: otherClipsContent -->
		<div class="span3">
			<div class="gallery-post">
				<div class="gallery-thumbnail">
					<a href="{OTHERCLIPSCONTENT.href}" rel="prettyPhoto[pp_gal]" > <img width="570" height="360" src="{OTHERCLIPSCONTENT.img}" alt="shutterstock_118896622" /> </a>
				</div>
				<div class="gallery-title four-columns">
					<a href="{OTHERCLIPSCONTENT.href}" title="{OTHERCLIPSCONTENT.title}"><h2>{OTHERCLIPSCONTENT.sortTitle}</h2></a>
					<p style="text-align: center;"><strong>{LANG.viewHits}</strong>: {OTHERCLIPSCONTENT.view}</p>
				</div>
			</div>
		</div>
		<!-- END: otherClipsContent -->
	</div>
	<!-- END: row4 -->
	<!-- END: otherClips -->
	<div class="clear"></div>
</div><!-- #main -->

</div>

<!-- END: main -->
