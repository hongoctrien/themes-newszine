<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES ., JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate Jan 17, 2011 11:34:27 AM
 */

if( !defined( 'NV_MAINFILE' ) )
	die( 'Stop!!!' );

if( defined( 'NV_IS_FILE_THEMES' ) )
{
	//include config theme
	require NV_ROOTDIR . '/modules/menu/menu_config.php';
}

if( !nv_function_exists( 'nv_menu_navbar' ) )
{

	/**
	 * nv_menu_navbar_check_current()
	 *
	 * @param mixed $url
	 * @param integer $type
	 * @return
	 */
	function nv_menu_navbar_check_current( $url, $type = 0 )
	{
		global $module_name, $home, $client_info, $global_config;

		$url = nv_unhtmlspecialchars( $url );

		if( $client_info['selfurl'] == $url )
			return true;
		// Chinh xac tuyet doi

		$_curr_url = NV_BASE_SITEURL . str_replace( $global_config['site_url'] . '/', '', $client_info['selfurl'] );
		$_url = nv_url_rewrite( $url, true );

		if( $home and ($_url == nv_url_rewrite( NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA ) or $_url == NV_BASE_SITEURL . 'index.php' or $_url == NV_BASE_SITEURL) )
		{
			return true;
		}
		elseif( $type == 2 )
		{
			if( preg_match( '#' . preg_quote( $_url, '#' ) . '#', $_curr_url ) )
				return true;
			return false;
		}
		elseif( $type == 1 )
		{
			if( preg_match( '#^' . preg_quote( $_url, '#' ) . '#', $_curr_url ) )
				return true;
			return false;
		}
		elseif( $_curr_url == $_url )
		{
			return true;
		}

		return false;
	}

	/**
	 * nv_menu_navbar()
	 *
	 * @param mixed $block_config
	 * @return
	 */
	function nv_menu_navbar( $block_config )
	{
		global $db, $db_config, $global_config, $site_mods, $module_info, $module_name, $module_file, $module_data, $lang_global, $catid, $home;

		if( file_exists( NV_ROOTDIR . '/themes/' . $global_config['module_theme'] . '/blocks/global.navbar.tpl' ) )
		{
			$block_theme = $global_config['module_theme'];
		}
		elseif( file_exists( NV_ROOTDIR . '/themes/' . $global_config['site_theme'] . '/blocks/global.navbar.tpl' ) )
		{
			$block_theme = $global_config['site_theme'];
		}
		else
		{
			$block_theme = 'default';
		}

		$array_menu = array( );
		$sql = 'SELECT id, parentid, title, link, note, subitem, groups_view, module_name, op, target, css, active_type FROM ' . NV_PREFIXLANG . '_menu_rows WHERE status=1 AND mid = ' . $block_config['menuid'] . ' ORDER BY weight ASC';
		$list = nv_db_cache( $sql, '', 'menu' );

		foreach( $list as $row )
		{
			if( nv_user_in_groups( $row['groups_view'] ) )
			{
				switch( $row['target'] )
				{
					case 1:
						$row['target'] = '';
						break;
					default:
						$row['target'] = ' onclick="this.target=\'_blank\'"';
				}

				$array_menu[$row['parentid']][$row['id']] = array(
					'id' => $row['id'],
					'title' => nv_clean60( $row['title'], $block_config['title_length'] ),
					'target' => $row['target'],
					'note' => empty( $row['note'] ) ? $row['title'] : $row['note'],
					'link' => nv_url_rewrite( nv_unhtmlspecialchars( $row['link'] ), true ),
					'css' => $row['css'],
					'active_type' => $row['active_type'],
				);
			}
		}

		$xtpl = new XTemplate( 'global.navbar.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/blocks' );
		$xtpl->assign( 'LANG', $lang_global );
		$xtpl->assign( 'NV_BASE_SITEURL', NV_BASE_SITEURL );
		$xtpl->assign( 'THEME_SEARCH_SUBMIT_ONCLICK', "nv_search_submit('topmenu_search_query', 'topmenu_search_submit', " . NV_MIN_SEARCH_LENGTH . ", " . NV_MAX_SEARCH_LENGTH . ");" );
		$xtpl->assign( 'THEME_SEARCH_QUERY_MAX_LENGTH', NV_MAX_SEARCH_LENGTH );
		
		$i = 1;
		foreach( $array_menu[0] as $id => $item )
		{
			$classcurrent = array( );
			if( isset( $array_menu[$id] ) )
			{
				$classcurrent[] = 'dropdown';
				foreach( $array_menu[$id] as $sid => $sitem )
				{
					if( isset( $array_menu[$sid] ) )
					{
						foreach( $array_menu[$sid] as $sid2 => $sitem2 )
						{
							$xtpl->assign( 'SUB2', $sitem2 );
							$xtpl->parse( 'main.navbar.sub.item.sub2.item2' );
						}
						$xtpl->parse( 'main.navbar.sub.item.sub2' );
					}
					$xtpl->assign( 'SUB', $sitem );
					$xtpl->parse( 'main.navbar.sub.item' );
				}
				$xtpl->parse( 'main.navbar.sub' );
				$xtpl->parse( 'main.navbar.has_sub' );
			}
			if( nv_menu_navbar_check_current( $item['link'], $item['active_type'] ) )
			{
				$classcurrent[] = 'active';
			}
			if( !empty( $item['class'] ) )
			{
				$classcurrent[] = $item['class'];
			}
			$item['current'] = empty( $classcurrent ) ? '' : ( implode( ' ', $classcurrent ));
			$xtpl->assign( 'navbar', $item );
			$xtpl->parse( 'main.navbar' );
		}

		$xtpl->parse( 'main' );
		return $xtpl->text( 'main' );
	}

}

if( defined( 'NV_SYSTEM' ) )
{
	$content = nv_menu_navbar( $block_config );
}
