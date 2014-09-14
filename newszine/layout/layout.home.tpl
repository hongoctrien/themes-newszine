<!-- BEGIN: main -->
{FILE "header_only.tpl"}
{FILE "header_extended.tpl"}

<div id="content" class="container">
	[THEME_ERROR_INFO]
	<div id="main" class="container">
		<div id="homepage-layout-3">
			<div class="layout-3">
				
				[HEADER]
				
				{MODULE_CONTENT}

				<!-- Row 3 Posts -->
				<div id="posts-row-3">
					<div class="row">
						<div class="span8">
						[BOTTOM]
						</div>
						<div class="span4">
							<div class="ads-container">
								<div class="ads-slot">
									[BOTTOM_RIGHT]
								</div>
							</div><!-- /.ads-container -->
						</div>
					</div>
				</div>
				<!-- /Row 3 Posts -->
			</div><!-- /.layout-2 -->
		</div><!-- /#main -->
	</div><!-- /#main -->

</div><!-- #content -->

{FILE "footer_extended.tpl"}
{FILE "footer_only.tpl"}
<!-- END: main -->