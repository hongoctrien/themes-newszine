<!-- BEGIN: main -->
<div id="posts-row-2" class="row posts">
	<!-- BEGIN: listcat -->
	<div class="span4">
		<div id="posts-1" class="post-section">
			<h2 class="section-heading home3row23 style-cat"><a href="{CAT.link}" title="{CAT.title}"><span style="text-transform: uppercase">{CAT.title}</span></a></h2>
			<div class="posts first-post">
				<div class="post-thumbnail">
					<a href="{CONTENT.link}" rel="bookmark"> <img style="max-width: 370px; max-height: 200px" src="{HOMEIMG}" alt="{HOMEIMGALT}" title="{CONTENT.title}" /> </a>
					<!-- BEGIN: newday -->
					<span class="post-label"> <img src="{NV_BASE_SITEURL}themes/{TEMPLATE}/images/new.png" alt="Gallery"></img> </span>
					<!-- END: newday -->
					<span class="meta-date">{CONTENT.publtime}</span>
				</div>
				<h1 class="post-title "><a href="{CONTENT.link}" rel="bookmark" title="{CONTENT.title}">{CONTENT.title0}</a></h1>
				<p class="post-excerpt">
					{CONTENT.hometext}
				</p>
			</div>
			<!-- BEGIN: related -->
			<!-- BEGIN: loop -->
			<div class="second-post clearfix">
				<div class="post-thumbnail align-left">
					<a href="{OTHER.link}" title="{OTHER.title}"> <img style="max-width: 90px; max-height: 55px" src="{OTHER.imghome}" alt="{OTHER.title}" /> </a>
				</div>
				<h1 class="post-title "><a href="{OTHER.link}" rel="bookmark" title="{OTHER.title}">{OTHER.title0}</a></h1>
				<p class="post-excerpt">
					{OTHER.hometext}
				</p>
			</div>
			<!-- END: loop -->
			<!-- END: related -->
		</div>
	</div>
	<!-- END: listcat -->
</div>
<!-- END: main -->