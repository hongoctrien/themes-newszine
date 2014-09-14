<!-- BEGIN: main -->
<!-- BEGIN: viewdescription -->
<div class="news_column">
	<div class="alert alert-info clearfix">
		<h3>{CONTENT.title}</h3>
		<!-- BEGIN: image -->
		<img alt="{CONTENT.title}" src="{HOMEIMG1}" width="{IMGWIDTH1}" class="img-thumbnail pull-left imghome" />
		<!-- END: image -->
		<p class="text-justify">
			{CONTENT.description}
		</p>
	</div>
</div>
<!-- END: viewdescription -->

<!-- BEGIN: viewcatloop -->
<article class="post-88 post type-post status-publish format-gallery hentry category-restaurant tag-magazine instock">
	<h2 class="entry-title"><span class="the_title"><a href="{CONTENT.link}" title="{CONTENT.title}" rel="bookmark">{CONTENT.title0}</a></span></h2>
	<div class="entry-meta row-fluid">
		<ul>
			<li>
				<em class="fa fa-clock-o">&nbsp;</em> {CONTENT.publtime}
			</li>
			<div class="clear"></div>
		</ul>
	</div>
	<div class="entry-content">
		<!-- BEGIN: image -->
		<a href="{CONTENT.link}" title="{CONTENT.title}"><img  alt="{HOMEIMGALT1}" src="{HOMEIMG1}" width="{IMGWIDTH1}" class="img-thumbnail pull-left imghome" /></a>
		<!-- END: image -->
		<p>
			{CONTENT.hometext}
		</p>
		<!-- BEGIN: adminlink -->
		<p class="text-right">
			{ADMINLINK}
		</p>
		<!-- END: adminlink -->
	</div>
</article>
<!-- END: viewcatloop -->

<!-- BEGIN: related -->
<hr/>
<h4>{ORTHERNEWS}</h4>
<ul class="related">
	<!-- BEGIN: loop -->
	<li>
		<em class="fa fa-angle-right">&nbsp;</em><a href="{RELATED.link}" title="{RELATED.title}">{RELATED.title} <em>({RELATED.publtime}) </em></a>
	</li>
	<!-- END: loop -->
</ul>
<!-- END: related -->

<!-- BEGIN: generate_page -->
<div class="text-center">
	{GENERATE_PAGE}
</div>
<!-- END: generate_page -->