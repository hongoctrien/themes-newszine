<!-- BEGIN: main -->
<div class="well text-center">
	<!-- BEGIN: display -->
	<div class="form-inline">
		<label style="margin-right: 20px">{LANG.chose_semest}</label>
		<label style="margin-right: 20px"><input type="radio" name="semest" value="0" checked="checked" />&nbsp;{LANG.chose_semest_1}</label>
		<label style="margin-right: 20px"><input type="radio" name="semest" value="1" {DATA.semest_check} />&nbsp;{LANG.chose_semest_2}</label>
	</div><br />
	<div>
		<select name="class" id="cl">{DATA.class}</select>
		<select name="course" id="co">{DATA.course}</select>
		<div id="notice" style="display: block; text-align: center">
			<em class="fa fa-spinner fa-3x fa-spin">&nbsp;</em>
			<p>{LANG.loading}</p>
		</div>
	</div>
	<!-- END: display -->
	
	<!-- BEGIN: error -->
	{DATA}
	<!-- END: error -->
</div>
<div class="table-responsive">
		<span id="point_html">&nbsp;</span>
</div>

<script type="text/javascript">
	$( window ).load(function() {
		var cl = $("#cl").val();
		var co = $("#co").val();
		var se = $("input[name=semest]:checked").val();
		nv_show_point_table( cl, co, se );
	});
	
	$('#cl, #co, input[name=semest]').on('change', function() {
		var cl = $("#cl").val();
		var co = $("#co").val();
		var se = $("input[name=semest]:checked").val();
		$('#notice').show();
		nv_show_point_table( cl, co, se );
	});
</script>
<!-- END: main -->