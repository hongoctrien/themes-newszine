<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES.,JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 3/9/2010 23:25
 */

if( ! defined( 'NV_MAINFILE' ) ) die( 'Stop!!!' );

if( ! nv_function_exists( 'nv_news_block_newscenter' ) )
{
	function nv_news_block_newscenter( $block_config )
	{
		global $module_data, $module_name, $module_file, $global_array_cat, $global_config, $lang_module, $db, $module_config, $module_info;
		
		$module_name = 'news';
		$module_data = 'news';
		
		$xtpl = new XTemplate( 'block_newscenter.tpl', NV_ROOTDIR . '/themes/' . $module_info['template'] . '/blocks' );
		$xtpl->assign( 'lang', $lang_module );
		$xtpl->assign( 'NV_BASE_SITEURL', NV_BASE_SITEURL );
		
		$db->sqlreset()
					->select( 'id, catid, publtime, title, alias, hometext, homeimgthumb, homeimgfile' )
					->from( NV_PREFIXLANG . '_' . $module_data . '_rows' )
					->where( 'status= 1' )
					->order( 'publtime DESC' )
					->limit( 5 );
		
		$list = nv_db_cache( $db->sql(), 'id', $module_name );
		
		$i = 1;
		foreach( $list as $row )
		{
			$row['publtime'] = nv_date( 'm/d/Y', $row['publtime'] );
			$row['link'] = NV_BASE_SITEURL . 'index.php?' . NV_LANG_VARIABLE . '=' . NV_LANG_DATA . '&amp;' . NV_NAME_VARIABLE . '=' . $module_name . '&amp;' . NV_OP_VARIABLE . '=' . $global_array_cat[$row['catid']]['alias'] . '/' . $row['alias'] . '-' . $row['id'] . $global_config['rewrite_exturl'];
			$row['title0'] = nv_clean60( strip_tags( $row['title'] ), $i == 1 ? 50 : 30 );
			$row['hometext'] = nv_clean60( strip_tags( $row['hometext'] ), 260 );

			$image = NV_UPLOADS_REAL_DIR . '/' . $module_name . '/' . $row['homeimgfile'];
	
			if( $row['homeimgfile'] != '' and file_exists( $image ) )
			{
				if( $i == 1 )
				{
					$width = 570;
					$height = 490;	
				}
				else
				{
					$width = 270;
					$height = 230;
				}
	
				$row['imgsource'] = NV_BASE_SITEURL . NV_UPLOADS_DIR . '/' . $module_name . '/' . $row['homeimgfile'];
				$imginfo = nv_is_image( $image );
				$basename = basename( $image );
				if( $imginfo['width'] > $width or $imginfo['height'] > $height )
				{
					$basename = preg_replace( '/(.*)(\.[a-zA-Z]+)$/', $module_name . '_' . $row['id'] . '_\1_' . $width . '-' . $height . '\2', $basename );
					if( file_exists( NV_ROOTDIR . '/' . NV_TEMP_DIR . '/' . $basename ) )
					{
						$row['imgsource'] = NV_BASE_SITEURL . NV_TEMP_DIR . '/' . $basename;
					}
					else
					{
						require_once NV_ROOTDIR . '/includes/class/image.class.php';
						$_image = new image( $image, NV_MAX_WIDTH, NV_MAX_HEIGHT );
						$_image->cropFromCenter( $width, $height );
						$_image->save( NV_ROOTDIR . '/' . NV_TEMP_DIR, $basename );
						if( file_exists( NV_ROOTDIR . '/' . NV_TEMP_DIR . '/' . $basename ) )
						{
							$row['imgsource'] = NV_BASE_SITEURL . NV_TEMP_DIR . '/' . $basename;
						}
					}
				}
			}
			elseif( nv_is_url( $row['homeimgfile'] ) )
			{
				$row['imgsource'] = $row['homeimgfile'];
			}
			elseif( ! empty( $module_config[$module_name]['show_no_image'] ) )
			{
				$row['imgsource'] =  NV_BASE_SITEURL . $module_config[$module_name]['show_no_image'];
			}
			else
			{
				$row['imgsource'] = NV_BASE_SITEURL . 'themes/' . $global_config['site_theme'] . '/images/no-image.png';
			}
		
			$xtpl->assign( 'main' . $i, $row );
			++$i;
		}
		
		$xtpl->parse( 'main' );
		return $xtpl->text( 'main' );
	}
}

if( defined( 'NV_SYSTEM' ) )
{
	$module = $block_config['module'];
	$content = nv_news_block_newscenter( $block_config );
}