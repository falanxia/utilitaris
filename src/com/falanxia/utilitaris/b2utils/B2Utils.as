/*
 * Falanxia Utilitaris.
 *
 * Copyright (c) 2011 Falanxia (http://falanxia.com)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package com.falanxia.utilitaris.b2utils {
	import flash.display.Sprite;



	/**
	 * B2Utils.
	 *
	 * @author Jakub Schimer / Falanxia a.s.
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 */
	public class B2Utils {



		/**
		 * Constructor.
		 */
		public function B2Utils() {
		}



		/**
		 * Set debug draw mode.
		 * @param world World reference
		 * @param debugDrawContainer Debug draw container
		 * @param debugScale Debug scale
		 * @return b2DebugDraw reference
		 * @see b2DebugDraw
		 */
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
