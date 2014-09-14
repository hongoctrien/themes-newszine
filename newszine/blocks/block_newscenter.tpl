<!-- BEGIN: main -->
<div class="featured-post layout3">
	<div class="posts-container row">
		<div id="featured-1" class="span6">
			<div class="post-thumbnail">
				<a href="{main1.link}" title="{main1.title}"><img width="570" height="490" src="{main1.imgsource}" alt="{main1.title}" /></a>
				<div class="post-meta">
					<div class="post-date">
						<span>{main1.publtime}</span>
					</div>
					<div class="post-title">
						<div class="title">
							<a href="{main1.link}" title="{main1.title}">{main1.title0}</a>
						</div>
						<p class="post-excerpt">
							{main1.hometext}
						</p>
					</div>
				</div>
			</div>
		</div>
		<div id="featured-3" class="span3">
			<div class="post-thumbnail">
				<a href="{main2.link}" title="{main2.title}"><img width="270" height="230" src="{main2.imgsource}" alt="{main2.title}" /></a>
				<div class="post-meta">
					<div class="post-date">
						<span>{main2.publtime}</span>
					</div>
					<div class="post-title">
						<div class="title">
							<a href="{main2.link}" title="{main2.title}" >{main2.title0}</a>
						</div>
					</div>
				</div>
			</div>
			<div class="post-thumbnail">
				<a href="{main3.link}" title="{main3.title}"><img width="270" height="230" src="{main3.imgsource}" alt="{main3.title}" /></a>
				<div class="post-meta">
					<div class="post-date">
						<span>{main3.publtime}</span>
					</div>
					<div class="post-title">
						<div class="title">
							<a href="{main3.link}" title="{main3.title}">{main3.title0}</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="featured-3" class="span3">
			<div class="post-thumbnail">
				<a href="{main4.link}" title="{main4.title}"><img width="270" height="230" src="{main4.imgsource}" alt="{main4.title}" /></a>
				<div class="post-meta">
					<div class="post-date">
						<span>{main4.publtime}</span>
					</div>
					<div class="post-title">
						<div class="title">
							<a href="{main4.link}" title="{main4.title}">{main4.title0}</a>
						</div>
					</div>
				</div>
			</div>
			<div class="post-thumbnail">
				<a href="{main5.link}" title="{main5.title}"><img width="270" height="230" src="{main5.imgsource}" alt="{main5.title}" /></a>
				<div class="post-meta">
					<div class="post-date">
						<span>{main5.publtime}</span>
					</div>
					<div class="post-title">
						<div class="title">
							<a href="{main5.link}" title="{main5.title}">{main5.title0}</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><!-- /.posts -->
</div><!-- /.featured-post -->
<!-- END: main -->

<div id="hot-news">
	<div class="panel panel-default news_column">
		<div class="panel-body clearfix">
			<a href="{main.link}"><img src="{main.imgsource}" alt="{main.title}" class="img-thumbnail pull-left imghome" style="width:183px"/></a><h3><a href="{main.link}">{main.title}</a></h3>
			<p class="text-justify">
				{main.hometext}
			</p>
			<p class="text-right">
				<a href="{main.link}"><em class="fa fa-sign-out">&nbsp;</em>{lang.more}</a>
			</p>
			<div class="clear">
				&nbsp;
			</div>
		</div>

		<ul class="other-news clearfix">
			<!-- BEGIN: othernews -->
			<li>
				<div class="content-box clearfix">
					<a href="{othernews.link}"><img src="{othernews.imgsource}" alt="{othernews.title}" class="img-thumbnail pull-left imghome" style="width:56px;"/></a>
					<h5><a {TITLE} class="show" href="{othernews.link}" data-content="{othernews.hometext}" data-img="{othernews.imgsource}" data-rel="block_newscenter_tooltip">{othernews.title}</a></h5>
					<div class="clear">
						&nbsp;
					</div>
				</div>
			</li>
			<!-- END: othernews -->
		</ul>
		<div class="clear">
			&nbsp;
		</div>
	</div>
</div>
<!-- BEGIN: tooltip -->
<script type="text/javascript">
	$(document).ready(function() {
	$("[data-rel='block_newscenter_tooltip']").tooltip({
	placement:"{TOOLTIP_POSITION}",html:true,title: function() {
	return '<img class="img-thumbnail pull-left margin_image" src="'+$(this).data('img')+'" width="90" /><p class="text-justify">'+$(this).data('content')+'</p><div class="clearfix"></div>';
	}
	});
	});
</script>
<!-- END: tooltip -->