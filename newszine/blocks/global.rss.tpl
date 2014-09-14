<!-- BEGIN: main  -->
<ul class="nv-list-item nv-block-rss lg">
	<!-- BEGIN: loop -->
	<li class="{DATA.class}">
		<a {DATA.target} title="{DATA.title}" href="{DATA.link}">{DATA.text}</a>
		<!-- BEGIN: pubDate -->
		<p class="text-muted">
			<em class="fa fa-calendar">&nbsp;</em> <em>{DATA.pubDate}</em>
		</p>
		<!-- END: pubDate -->
		<!-- BEGIN: description -->
		{DATA.description}
		<!-- END: description -->
	</li>
	<!-- END: loop -->
</ul>
<!-- END: main -->