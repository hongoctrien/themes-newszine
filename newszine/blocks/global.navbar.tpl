<!-- BEGIN: main -->
<div id="main-menu" class="container">
	<div id="secondary_menu" class="main-menu row">
		<ul class="nav span9 pull-left">
			<li>
				<a href="{NV_BASE_SITEURL}"><i class="fa fa-home fa-lg"></i></a>
			</li>
			<!-- BEGIN: navbar -->
			<li class="dropdown {navbar.current}">
				<a href="{navbar.link}" title="{navbar.title}">{navbar.title}</a>
				<!-- BEGIN: sub -->
				<ul class="sub-menu">
					<!-- BEGIN: item -->
					<li>
						<a href="{SUB.link}" title="{SUB.title}">{SUB.title}</a>
						<!-- BEGIN: sub2 -->
						<ul class="sub-menu">
							<!-- BEGIN: item2 -->
							<li>
								<a href="{SUB2.link}" title="{SUB2.title}">{SUB2.title}</a>
							</li>
							<!-- END: item2 -->
						</ul>
						<!-- END: sub2 -->
					</li>
					<!-- END: item -->
				</ul>
				<!-- END: sub -->
			</li>
			<!-- END: navbar -->
		</ul><!--/.nav-collapse -->
		
		<div class="search span3 pull-right">
			<!-- Ajaxy Search Form v2.2.0 -->
			<div class="sf_container">
				<form role="search" method="get" class="searchform" action="{NV_BASE_SITEURL}" onsubmit="return {THEME_SEARCH_SUBMIT_ONCLICK}">
					<p>
						<input type="hidden" name="{NV_LANG_VARIABLE}" value="{NV_LANG_DATA}" />
						<input type="hidden" name="{NV_NAME_VARIABLE}" value="seek" />
						<input type="text" id="topmenu_search_query" maxlength="{THEME_SEARCH_QUERY_MAX_LENGTH}" name="q" placeholder="{LANG.search}..." />
						<input type="submit" id="topmenu_search_submit" value="Search" />
					</p>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- END: main -->