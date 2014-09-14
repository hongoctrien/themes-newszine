<!-- BEGIN: main -->
<!-- BEGIN: facebookjssdk -->
<div id="fb-root"></div>
<script type="text/javascript">
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/{FACEBOOK_LANG}/all.js#xfbml=1&appId={FACEBOOK_APPID}";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>
<!-- END: facebookjssdk -->

<article class="post">
	<h2 class="entry-title"><span class="the_title">{DETAIL.title}</span></h2>
	
	    <!-- BEGIN: socialbutton -->
		<div id="author-post-90" class="author-info">
			<div class="author-box clearfix" style="padding-top: 6px">
				<div class="pull-left"><em class="fa fa-clock-o">&nbsp;</em> {DETAIL.publtime}</div>
			    <div class="socialicon pull-right">
			    	<ul style="list-style: none">
			        <li class="pull-left" style="margin-right: 30px"><div class="fb-like" data-href="{SELFURL}" data-width="The pixel width of the plugin" data-height="The pixel height of the plugin" data-colorscheme="light" data-layout="button_count" data-action="like" data-show-faces="true" data-share="true" data-send="false">&nbsp;</div></li>        
			        <li class="pull-left"><div class="g-plusone" data-size="medium"></div></li>
			        <script type="text/javascript">
			          window.___gcfg = {lang: nv_sitelang};
			          (function() {
			            var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
			            po.src = 'https://apis.google.com/js/plusone.js';
			            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
			          })();
			        </script>
			
			        <li class="pull-left"><a href="http://twitter.com/share" class="twitter-share-button">Tweet</a></li>
			        </ul>
			        <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
			    </div>
			</div>
		</div>
	    <div class="clear">&nbsp;</div>
	    <!-- END: socialbutton -->
	
    <div class="clear">&nbsp;</div>
	<!-- BEGIN: showhometext -->
	<div id="hometext">
		<!-- BEGIN: imgthumb -->
		<div class="imghome pull-left text-center" style="width:{DETAIL.image.width}px; margin-right: 10px;">
			<a href="{DETAIL.homeimgfile}" title="{DETAIL.image.note}" rel="shadowbox"><img alt="{DETAIL.image.alt}" src="{DETAIL.image.src}" alt="{DETAIL.image.note}" width="{DETAIL.image.width}" class="img-thumbnail" /></a>
			<em>{DETAIL.image.note}</em>
		</div>
		<!-- END: imgthumb -->
		<h2>{DETAIL.hometext}</h2>
	</div>
	<!-- BEGIN: imgfull -->
	<div style="max-width:{DETAIL.image.width}px;margin: 10px auto 10px auto" class="text-center">
		<img alt="{DETAIL.image.alt}" src="{DETAIL.image.src}" width="{DETAIL.image.width}" class="img-thumbnail" />
		<p class="imgalt">
			<em>{DETAIL.image.note}</em>
		</p>
	</div>
	<!-- END: imgfull -->
	<!-- END: showhometext -->

	<div class="entry-content">
		<div class="bodytext">
			{DETAIL.bodytext}
		</div>
		
		<div class="ratings hreview-aggregate" data-post="90">
			<!-- BEGIN: author -->
			<div class="meta">
				<!-- BEGIN: name -->
				<strong class="votes">{LANG.author}: </strong>{DETAIL.author}
				<!-- END: name -->
				<!-- BEGIN: source -->
				&nbsp;&nbsp;&nbsp;<strong class="votes">{LANG.source}: </strong>{DETAIL.source}
				<!-- END: source -->
			</div>
			<!-- END: author -->
		</div>
		
		<!-- BEGIN: copyright -->
		<div id="author-post-90" class="author-info">
			<div class="author-box clearfix">
				{COPYRIGHT}
			</div>
		</div>
		<!-- END: copyright -->
		

		<!-- BEGIN: adminlink -->
		<p class="text-center adminlink">
			{ADMINLINK}
		</p>
		<!-- END: adminlink -->
		
		<hr />
		
		<div id="author-post-90" class="author-info">
			<div class="author-box clearfix">
				<!-- BEGIN: keywords -->
				<div class="author-details">
					<div id="tag_cloud-2" class="widget widget_tag_cloud">
						<div class="tagcloud">
							<!-- BEGIN: loop -->
							<a title="{KEYWORD}" href='{LINK_KEYWORDS}' style='font-size: 14px;'>{KEYWORD}</a>
							<!-- END: loop -->
						</div>
					</div>
				</div>
				<!-- END: keywords -->
				
				<div class="author-social">
				<!-- BEGIN: allowed_rating -->
					<form id="form3B" action="" style="margin: 0">
						<div class="clearfix">
							<div id="stringrating">
								{STRINGRATING}
							</div>
				            <!-- BEGIN: data_rating -->
				            <span itemscope itemtype="http://data-vocabulary.org/Review-aggregate">
				               {LANG.rating_average}:
				               <span itemprop="rating">{DETAIL.numberrating}</span> -
				               <span itemprop="votes">{DETAIL.click_rating}</span> {LANG.rating_count}
				            </span>
				            <!-- END: data_rating -->
							<div style="padding: 5px;">
								<input class="hover-star" type="radio" value="1" title="{LANGSTAR.verypoor}" /><input class="hover-star" type="radio" value="2" title="{LANGSTAR.poor}" /><input class="hover-star" type="radio" value="3" title="{LANGSTAR.ok}" /><input class="hover-star" type="radio" value="4" title="{LANGSTAR.good}" /><input class="hover-star" type="radio" value="5" title="{LANGSTAR.verygood}" /><span id="hover-test" style="margin: 0 0 0 20px;">{LANGSTAR.note}</span>
							</div>
						</div>
					</form>
					<script type="text/javascript">
						var sr = 0;
						$('.hover-star').rating({
							focus : function(value, link) {
								var tip = $('#hover-test');
								if (sr != 2) {
									tip[0].data = tip[0].data || tip.html();
									tip.html(link.title || 'value: ' + value);
									sr = 1;
								}
							},
							blur : function(value, link) {
								var tip = $('#hover-test');
								if (sr != 2) {
									$('#hover-test').html(tip[0].data || '');
									sr = 1;
								}
							},
							callback : function(value, link) {
								if (sr == 1) {
									sr = 2;
									$('.hover-star').rating('disable');
									sendrating('{NEWSID}', value, '{NEWSCHECKSS}');
								}
							}
						});
	
						$('.hover-star').rating('select', '{NUMBERRATING}');
					</script>
					<!-- BEGIN: disablerating -->
					<script type="text/javascript">
						$(".hover-star").rating('disable');
						sr = 2;
					</script>
					<!-- END: disablerating -->
					<!-- END: allowed_rating -->
				</div>
			</div>
		</div>
		
		<!-- BEGIN: topic -->
		<div class="related-posts">
			<h3 class="title title-line related-title"><span>{LANG.topic}</span></h3>
			<div class="row-fluid">
				<!-- BEGIN: loop -->
				<div class="span3 text-center">
					<div class="post-thumbnail">
						<a href="{TOPIC.link}" title="{TOPIC.title}"> <img style="max-width: 100px; max-height: 100px" src="{TOPIC.imghome}" alt="{TOPIC.title}" /> </a> ({TOPIC.title})
					</div>
					<div class="post-title">
					</div>
				</div>
				<!-- END: loop -->
			</div>
		</div>
		<!-- END: topic -->
		
		<!-- BEGIN: related_new -->
		<div class="related-posts">
			<h3 class="title title-line related-title"><span>{LANG.related_new}</span></h3>
			<div class="row-fluid">
				<!-- BEGIN: loop -->
				<div class="span3 text-center">
					<div class="post-thumbnail">
						<a href="{RELATED_NEW.link}" title="{RELATED_NEW.title}"> <img style="max-width: 100px; max-height: 100px" src="{RELATED_NEW.imghome}" alt="{RELATED_NEW.title}" /> </a>
					</div>
					<div class="post-title">
						<a href="{RELATED_NEW.link}" title="{RELATED_NEW.title}">{RELATED_NEW.title}</a> ({RELATED_NEW.time})
					</div>
				</div>
				<!-- END: loop -->
			</div>
		</div>
		<!-- END: related_new -->
		
		<!-- BEGIN: related -->
		<div class="related-posts">
			<h3 class="title title-line related-title"><span>{LANG.related}</span></h3>
			<div class="row-fluid">
				<!-- BEGIN: loop -->
				<div class="span3 text-center">
					<div class="post-thumbnail">
						<a href="{RELATED.link}" title="{RELATED.title}"> <img style="max-width: 100px; max-height: 100px" src="{RELATED.imghome}" alt="{RELATED.title}" /> </a>
					</div>
					<div class="post-title">
						<a href="{RELATED.link}" title="{RELATED.title}">{RELATED.title}</a> ({RELATED.time})
					</div>
				</div>
				<!-- END: loop -->
			</div>
		</div>
		<!-- END: related -->
	</div>
</article>

<!-- BEGIN: comment -->
<iframe src="{NV_COMM_URL}" id = "fcomment" onload = "nv_setIframeHeight( this.id )" style="width: 100%; min-height: 300px; max-height: 1000px"></iframe>
<!-- END: comment -->

<!-- END: main -->
<!-- BEGIN: no_permission -->
<div id="no_permission">
	<p>
		{NO_PERMISSION}
	</p>
</div>
<!-- END: no_permission -->