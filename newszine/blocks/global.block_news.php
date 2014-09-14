<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES.,JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 3/9/2010 23:25
 */

if( ! defined( 'NV_MAINFILE' ) ) die( 'Stop!!!' );

if( ! nv_function_exists( 'nv_news_block_news' ) )
{

	function nv_block_config_news( $module, $data_block, $lang_block )
	{
		$html = '<tr>';
		$html .= '	<td>' . $lang_block['numrow'] . '</td>';
		$html .= '	<td><input type="text" name="config_numrow" class="form-control w100" size="5" value="' . $data_block['numrow'] . '"/></td>';
		$html .= '</tr>';
		return $html;
	}

	function nv_block_config_news_submit( $module, $lang_block )
	{
		global $nv_Request;
		$return = array();
		$return['error'] = array();
		$return['config'] = array();
		$return['config']['numrow'] = $nv_Request->get_int( 'config_numrow', 'post', 0 );
		return $return;
	}

	function nv_news_block_news( $block_config, $mod_data )
	{
		global $module_array_cat, $module_info, $db, $module_config, $global_config;

		$module = 'news';
		$blockwidth = $module_config[$module]['blockwidth'];
		$show_no_image = $module_config[$module]['show_no_image'];
		$numrow = ( isset( $block_config['numrow'] ) ) ? $block_config['numrow'] : 20;

		$cache_file = NV_LANG_DATA . '__block_news_' . $numrow . '_' . NV_CACHE_PREFIX . '.cache';
		if( ( $cache = nv_get_cache( $module, $cache_file ) ) != false )
		{
			$array_block_news = unserialize( $cache );
		}
		else
		{
			$array_block_news = array();

			$db->sqlreset()
				->select( 'id, catid, publtime, exptime, title, alias, homeimgthumb, homeimgfile, hometext' )
				->from( NV_PREFIXLANG . '_' . $mod_data . '_rows' )
				->where( 'status= 1' )
				->order( 'publtime DESC' )
				->limit( $numrow );
			$result = $db->query( $db->sql() );
			
			while( list( $id, $catid, $publtime, $exptime, $title, $alias, $homeimgthumb, $homeimgfile, $hometext ) = $result->fetch( 3 ) )
			{
				$link = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module . '&amp;' . NV_OP_VARIABLE . '=' . $module_array_cat[$catid]['alias'] . '/' . $alias . '-' . $id . $global_config['rewrite_exturl'];
				
				$array_block_news[] = array(
					'id' => $id,
					'title' => $title,
					'link' => $link,
					'homeimgfile' => $homeimgfile,
					'width' => $blockwidth,
					'hometext' => $hometext
				);
			}
			$cache = serialize( $array_block_news );
			nv_set_cache( $module, $cache_file, $cache );
		}

		if( file_exists( NV_ROOTDIR . '/themes/' . $module_info['template'] . '/blocks/block_news.tpl' ) )
		{
			$block_theme = $module_info['template'];
		}
		else
		{
			$block_theme = 'default';
		}
		$xtpl = new XTemplate( 'block_news.tpl', NV_ROOTDIR . '/themes/' . $block_theme . '/blocks/' );
		
		$i = 1;
		foreach( $array_block_news as $array_news )
		{
			$array_news['hometext'] = nv_clean60( $array_news['hometext'], 20 );
			
			$image = NV_UPLOADS_REAL_DIR . '/' . $module . '/' . $array_news['homeimgfile'];

			if( $array_news['homeimgfile'] != '' and file_exists( $image ) )
			{
				if( $i == 1 )
				{
					$width = 370;
					$height = 150;	
				}
				else
				{
					$width = 170;
					$height = 115;
				}
	
				$array_news['imgurl'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_name . '/' . $array_news['homeimgfile'];
				$imginfo = nv_is_image( $image );
				$basename = basename( $image );
				if( $imginfo['width'] > $width or $imginfo['height'] > $height )
				{
					$basename = preg_replace( '/(.*)(\.[a-zA-Z]+)$/', $module_name . '_' . $row['id'] . '_\1_' . $width . '-' . $height . '\2', $basename );
					if( file_exists( NV_ROOTDIR . '/' . NV_TEMP_DIR . '/' . $basename ) )
					{
						$array_news['imgurl'] = NV_BASE_SITEURL . NV_TEMP_DIR . '/' . $basename;
					}
					else
					{
						require_once NV_ROOTDIR . '/includes/class/image.class.php';
						$_image = new image( $image, NV_MAX_WIDTH, NV_MAX_HEIGHT );
						$_image->cropFromCenter( $width, $height );
						$_image->save( NV_ROOTDIR . '/' . NV_TEMP_DIR, $basename );
						if( file_exists( NV_ROOTDIR . '/' . NV_TEMP_DIR . '/' . $basename ) )
						{
							$array_news['imgurl'] = NV_BASE_SITEURL . NV_TEMP_DIR . '/' . $basename;
						}
					}
				}
			}
			elseif( nv_is_url( $array_news['homeimgfile'] ) )
			{
				$array_news['imgurl'] = $array_news['homeimgfile'];
			}
			elseif( ! empty( $module_config[$module_name]['show_no_image'] ) )
			{
				$array_news['imgurl'] =  NV_BASE_SITEURL . $module_config[$module_name]['show_no_image'];
			}
			else
			{
				$array_news['imgurl'] = NV_BASE_SITEURL . 'themes/' . $global_config['site_theme'] . '/images/no-image.png';
			}
			
			$xtpl->assign( 'blocknews', $array_news );
						
			if( $i == 1 )
			{
				$xtpl->parse( 'main.news_main' );
			}
			else
			{
				$array_news['title0'] = nv_clean60( $array_news['title'], 40 );
				$xtpl->assign( 'blocknews', $array_news );
				
				$xtpl->assign( 'FL', ($i % 2 != 0) ? 'right' : 'left' );
				$xtpl->parse( 'main.newsloop' );
			}
			
			$i++;
		}

		$xtpl->parse( 'main' );
		return $xtpl->text( 'main' );
	}
}

if( defined( 'NV_SYSTEM' ) )
{
	global $site_mods, $module_name, $global_array_cat, $module_array_cat;
	$module = 'news';
	if( isset( $site_mods[$module] ) )
	{
		$mod_data = $site_mods[$module]['module_data'];
		if( $module == $module_name )
		{
			$module_array_cat = $global_array_cat;
			unset( $module_array_cat[0] );
		}
		else
		{
			$module_array_cat = array();
			$sql = 'SELECT catid, parentid, title, alias, viewcat, subcatid, numlinks, description, inhome, keywords, groups_view FROM ' . NV_PREFIXLANG . '_' . $mod_data . '_cat ORDER BY sort ASC';
			$list = nv_db_cache( $sql, 'catid', $module );
			foreach( $list as $l )
			{
				$module_array_cat[$l['catid']] = $l;
				$module_array_cat[$l['catid']]['link'] = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module . '&amp;' . NV_OP_VARIABLE . '=' . $l['alias'];
			}
		}
		$content = nv_news_block_news( $block_config, $mod_data );
	}
}