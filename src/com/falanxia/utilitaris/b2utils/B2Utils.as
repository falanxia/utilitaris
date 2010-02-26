/*
 * Copyright (c) 2010 Vaclav Vancura (http://vaclav.vancura.org)
 */

package com.falanxia.utilitaris.b2utils {

	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2World;

	import flash.display.Sprite;



	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. jakub.schimer@falanxia.com
	 * @since
	 */
	public class B2Utils {
		/**
		 * Constructor.
		 */
		public function B2Utils() {
		}



		public static function setDebugDraw(world:b2World, debugDrawContainer:Sprite, debugScale:Number):b2DebugDraw {

			var debugDraw:b2DebugDraw = new b2DebugDraw();
			debugDraw.m_sprite = debugDrawContainer;
			debugDraw.m_drawScale = debugScale;
			debugDraw.m_fillAlpha = 0.3;
			debugDraw.m_lineThickness = 1.0;
			debugDraw.m_drawFlags = b2DebugDraw.e_shapeBit | b2DebugDraw.e_jointBit | b2DebugDraw.e_centerOfMassBit;
			world.SetDebugDraw(debugDraw);

			return debugDraw;

		}
	}

}
