/*
 * Falanxia Utilitaris.
 *
 * Copyright (c) 2010 Falanxia (http://falanxia.com)
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

package com.falanxia.utilitaris.display {
	import com.falanxia.utilitaris.utils.ObjectUtils;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	import flash.geom.Rectangle;



	/**
	 * Quick Bitmap.
	 * Quick creation of {@code Bitmap} with initial settings.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. vaclav@falanxia.com
	 * @since 1.0
	 * @see QSprite
	 * @see QTextField
	 * @see QVideo
	 */
	public class QBitmap extends Bitmap {



		/**
		 * Constructor.
		 * All parameters from the {@code config} Object are parsed and applied to the newly created {@code Bitmap}.
		 * @usageNote Additionally these parameters are added:
		 *      <ul>
		 *          <li>{@code embed} - {@code Bitmap} or {@code BitmapData} to be used as {@code Bitmap} source</li>
		 *      </ul>
		 * @param config Config {@code Object}
		 * @param parent Parent {@code DisplayObjectContainer}
		 * @throws TypeError if embedded {@code Bitmap} or {@code BitmapData} is invalid
		 * @example Example code:
		 *      <code>
		 *          [Embed(source="bitmap-test.png")] private static var _bitmapTest:Class;
		 *		    var myBitmap:QBitmap = new QBitmap({embed:new _bitmapTest(), x:100, y:50, alpha:.5});
		 *		    addChild(myBitmap);
		 *      </code>
		 * @example Another example directly adding new {@code QBitmap} to {@code this} {@code DisplayObjectContainer}:
		 *      <code>
		 *          var myBitmap:QBitmap = new QBitmap({embed:new _bitmapTest()}, this);
		 *      </code>
		 */
		public function QBitmap(config:Object = null, parent:DisplayObjectContainer = null) {
			// if config is not defined, prepare it
			var c:Object;

			if(config == null) c = new Object();
			else c = config;

			super();

			// Bitmap overrides and custom config
			if(c.embed) {
				if(c.embed is Bitmap) {
					this.bitmapData = c.embed.bitmapData;
				} else if(c.embed is BitmapData) {
					this.bitmapData = c.embed;
				}
				else {
					throw new TypeError("Invalid embed object");
				}
			}

			// assign parameters
			ObjectUtils.assign(this, c);

			// add child if requested
			if(parent != null) parent.addChild(this);
		}



		/* ★ SETTERS & GETTERS ★ */


		/**
		 * Moves to the specified position.
		 * @param p New position as {@code Point}
		 */
		public function set position(p:Point):void {
			this.x = p.x;
			this.y = p.y;
		}



		/**
		 * Rescales to new size.
		 * @param rect New size as {@code Rectangle}
		 */
		public function set size(rect:Rectangle):void {
			this.width = rect.width;
			this.height = rect.height;
		}



		/**
		 * Set position and size at once to speed up things.
		 * @param rect Scale {@code Rectangle}
		 */
		public function set positionAndSize(rect:Rectangle):void {
			this.x = rect.x;
			this.y = rect.y;
			this.width = rect.width;
			this.height = rect.height;
		}



		/**
		 * Get current position as {@code Point}.
		 * @return Current position as {@code Point}
		 */
		public function get position():Point {
			return new Point(this.x, this.y);
		}



		/**
		 * Get current size as {@code Rectangle}.
		 * @return Current size as {@code Rectangle}
		 */
		public function get size():Rectangle {
			return new Rectangle(0, 0, this.width, this.height);
		}



		/**
		 * Get current position and size as {@code Rectangle}.
		 * @return Current position and size as {@code Rectangle}
		 */
		public function get positionAndSize():Rectangle {
			return new Rectangle(this.x, this.y, this.width, this.height);
		}
	}
}
