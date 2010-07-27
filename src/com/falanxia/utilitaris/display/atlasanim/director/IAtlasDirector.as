/*
 * Falanxia BzoonkBar.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */

package com.falanxia.utilitaris.display.atlasanim.director {
	import com.falanxia.utilitaris.display.atlasanim.anim.IAtlasAnim;



	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since
	 */
	public interface IAtlasDirector {

		function start():void;

		function stop():void;

		function registerAnim(atlasAnim:IAtlasAnim):Boolean;

		function unregisterAnim(atlasAnim:IAtlasAnim):Boolean;

		function unregisterAll():void;

	}
}
