<!-- BEGIN: main -->
<!-- BEGIN: topicList -->
<div class="otherTopic marginbottom15 clearfix">
    <div class="otherTopicCont">
    <div>
    <strong>{OTHETP}:</strong>
    <!-- BEGIN: row1 -->
    &nbsp;&nbsp;<a href="{OTHERTOPIC.href}"><!-- BEGIN: img1 --><img src="{NV_BASE_SITEURL}{OTHERTOPIC.img}" width="24" height="24" alt="" /><!-- END: img1 -->{OTHERTOPIC.title}</a><!-- BEGIN: iss1 --><span>&darr;</span><!-- END: iss1 -->
    <!-- END: row1 -->
    </div>
    </div>
</div>
<!-- END: topicList -->

<div id="main" class="row-fluid galleries">
	<header class="entry-header">
		<h1 class="entry-title"><span>{LANG.new_video}</span></h1>
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

<div class="text-center">
	{NV_GENERATE_PAGE}
</div>
	
<!-- END: main -->