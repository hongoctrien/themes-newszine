<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES ., JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Jan 17, 2011 11:34:27 AM
 */

if( !defined( 'NV_MAINFILE' ) ) die( 'Stop!!!' );

if( ! nv_function_exists( 'nv_menu_social_icon' ) )
{
	function nv_block_config_social_icon( $module, $data_block, $lang_block )
	{
		$html = '';
		$html .= "<tr>";
		$html .= "<td>Facebook</td>";
		$html .= "<td><input type=\"text\" class=\"form-control\" name=\"config_facebook\" value=\"" . $data_block['facebook'] . "\"/></td>";
		$html .= "</tr>";
		$html .= "<tr>";
		$html .= "<td>Twitter</td>";
		$html .= "<td><input type=\"text\" class=\"form-control\" name=\"config_twitter\" value=\"" . $data_block['twitter'] . "\"/></td>";
		$html .= "</tr>";
		$html .= "<tr>";
		$html .= "<td>Rss</td>";
		$html .= "<td><input type=\"text\" class=\"form-control\" name=\"config_rss\" value=\"" . $data_block['rss'] . "\"/></td>";
		$html .= "</tr>";
		$html .= "<tr>";
		$html .= "<td>Youtube</td>";
		$html .= "<td><input type=\"text\" class=\"form-control\" name=\"config_youtube\" value=\"" . $data_block['youtube'] . "\"/></td>";
		$html .= "</tr>";
		$html .= "<tr>";
		$html .= "<td>G+</td>";
		$html .= "<td><input type=\"text\" class=\"form-control\" name=\"config_g\" value=\"" . $data_block['g'] . "\"/></td>";
		$html .= "</tr>";
		$html .= '<td>' . $lang_block['position'] . '</td>';
		$html .= '<td><select name="config_position" class="form-control w200">';
		$sel = $block_config['position'] == 'top_menu' ? 'selected' : '';
		$html .= '<option value="top_menu" ' . $sel . '>' . $lang_block['top_menu'] . '</option>';
		$sel = $block_config['position'] == 'footer' ? 'selected' : '';
		$html .= '<option value="footer" ' . $sel . '>' . $lang_block['footer'] . '</option>';
		$html .= '</select></td>';
		$html .= '</tr>';
		return $html;
	}
	
	/**
	 * nv_block_config_menu_submit()
	 *
	 * @param mixed $module
	 * @param mixed $lang_block
	 * @return
	 */
	function nv_block_config_social_icon_submit( $module, $lang_block )
	{
		global $nv_Request;
		$return = array();
		$return['error'] = array();
		$return['config'] = array();
		$return['config']['facebook'] = $nv_Request->get_string( 'config_facebook', 'post', '' );
		$return['config']['twitter'] = $nv_Request->get_string( 'config_twitter', 'post', '' );
		$return['config']['rss'] = $nv_Request->get_string( 'config_rss', 'post', '' );
		$return['config']['youtube'] = $nv_Request->get_string( 'config_youtube', 'post', '' );
		$return['config']['g'] = $nv_Request->get_string( 'config_g', 'post', '' );
		$return['config']['position'] = $nv_Request->get_string( 'config_position', 'post', '' );
		return $return;
	}

	/**
	 * nv_menu_social_icon()
	 *
	 * @param mixed $block_config
	 * @return
	 */
	function nv_menu_social_icon( $block_config )
	{
		global $db, $db_config, $global_config, $site_mods, $module_info, $module_name, $module_file, $module_data, $lang_global, $catid, $home;

		if( $block_config['position'] == 'top_menu' )
		{
			$block_file = 'global.social_icon_top_menu.tpl';
		}
		else
		{
			$block_file = 'global.social_icon_footer.tpl';
		}
		
		if( file_exists( NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/blocks/' . $block_file ) )
		{
			$block_theme = $global_config['module_theme'];
		}
		elseif( file_exists( NV_ROOTDIR . '/themes/' . $global_config['site_theme'] . '/blocks/' . $block_file ) )
		{
			$block_theme = $global_config['site_theme'];
		}
		else
		{
			$block_theme = 'default';
		}

		$xtpl = new XTemplate( $block_file, NV_ROOTDIR . '/themes/' . $block_theme . '/blocks' );
		$xtpl->assign( 'DATA', $block_config );
		
		if( ! empty( $block_config['facebook'] ) )
		{
			$xtpl->parse( 'main.facebook' );
		}
		
		if( ! empty( $block_config['twitter'] ) )
		{
			$xtpl->parse( 'main.twitter' );
		}
		
		if( ! empty( $block_config['rss'] ) )
		{
			$xtpl->parse( 'main.rss' );
		}
		
		if( ! empty( $block_config['youtube'] ) )
		{
			$xtpl->parse( 'main.youtube' );
		}
		
		if( ! empty( $block_config['g'] ) )
		{
			$xtpl->parse( 'main.google_plus' );
		}

		$xtpl->parse( 'main' );
		return $xtpl->text( 'main' );
	}
}

if( defined( 'NV_SYSTEM' ) )
{
	$content = nv_menu_social_icon( $block_config );
}
