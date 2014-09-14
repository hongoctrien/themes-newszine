<!-- BEGIN: main -->
<!-- BEGIN: topicdescription -->
<div class="news_column">
	<div class="alert alert-info clearfix">
		<h3>{TOPPIC_TITLE}</h3>
		<!-- BEGIN: image -->
		<img alt="{TOPPIC_TITLE}" src="{HOMEIMG1}" width="{IMGWIDTH1}" class="img-thumbnail pull-left imghome" />
		<!-- END: image -->
		<p class="text-justify">{TOPPIC_DESCRIPTION}</p>
	</div>
</div>
<!-- END: topicdescription -->

<!-- BEGIN: topic -->
<article class="post-88 post type-post status-publish format-gallery hentry category-restaurant tag-magazine instock">
	<h2 class="entry-title"><span class="the_title"><a href="{TOPIC.link}" title="{TOPIC.title}" rel="bookmark">{TOPIC.title0}</a></span></h2>
	<div class="entry-meta row-fluid">
		<ul>
			<li>
				<em class="fa fa-clock-o">&nbsp;</em> {TIME} {DATE}
			</li>
			<div class="clear"></div>
		</ul>
	</div>
	<div class="entry-content">
		<!-- BEGIN: homethumb -->
		<a href="{TOPIC.link}" title="{TOPIC.title}"><img  alt="{TOPIC.alt}" src="{TOPIC.src}" width="{TOPIC.width}" class="img-thumbnail pull-left imghome" /></a>
		<!-- END: homethumb -->
		<p>
			{TOPIC.hometext}
		</p>
		<!-- BEGIN: adminlink -->
		<p class="text-right">
			{ADMINLINK}
		</p>
		<!-- END: adminlink -->
	</div>
</article>
<!-- END: topic -->


<!-- BEGIN: other -->
<ul class="related">
	<!-- BEGIN: loop -->
	<li>
		<a title="{TOPIC_OTHER.title}" href="{TOPIC_OTHER.link}">{TOPIC_OTHER.title}</a>
		<em>({TOPIC_OTHER.publtime})</em>
	</li>
	<!-- END: loop -->
</ul>
<!-- END: other -->

<!-- BEGIN: generate_page -->
<div class="text-center">
	{GENERATE_PAGE}
</div>
<!-- END: generate_page -->
<!-- END: main -->