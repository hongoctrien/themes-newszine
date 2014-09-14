<!-- BEGIN: main -->
{FILE "header_only.tpl"}
{FILE "header_extended.tpl"}

<div id="content" class="container">
	<div id="main" class="row-fluid">
		<div id="main-left" class="span8">
			{MODULE_CONTENT}
			[BOTTOM]
		</div>

		<div id="sidebar" class="span4">
			[RIGHT]
		</div>
		<div class="clearfix"></div>
	</div><!-- #main -->
</div><!-- #content -->

{FILE "footer_extended.tpl"}
{FILE "footer_only.tpl"}
<!-- END: main -->