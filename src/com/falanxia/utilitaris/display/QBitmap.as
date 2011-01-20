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

package com.falanxia.utilitaris.display {
	import com.falanxia.utilitaris.interfaces.IQ;
	import com.falanxia.utilitaris.types.Size;
	import com.falanxia.utilitaris.utils.ObjectUtils;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	import flash.geom.Rectangle;



	/**
	 * Quick Bitmap.
	 * Quick creation of Bitmap with initial settings.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @since 1.0
	 * @see QSprite
	 * @see QTextField
	 * @see QVideo
	 */
	public class QBitmap extends Bitmap implements IQ {



		/**
		 * Constructor.
		 * All parameters from the config Object are parsed and applied to the newly created Bitmap.
		 * @usageNote Additionally these parameters are added:
		 *      <ul>
		 *          <li>embed - Bitmap or BitmapData to be used as Bitmap source</li>
		 *      </ul>
		 * @param displayConfig Config Object
		 * @param displayParent Parent DisplayObjectContainer
		 * @throws TypeError if embedded Bitmap or BitmapData is invalid
		 * @example Example code:
		 *      <code>
		 *          [Embed(source="bitmap-test.png")] private static var _bitmapTest:Class;
		 *		    var myBitmap:QBitmap = new QBitmap({embed:new _bitmapTest(), x:100, y:50, alpha:.5});
		 *		    addChild(myBitmap);
		 *      </code>
		 * @example Another example directly adding new QBitmap to this DisplayObjectContainer:
		 *      <code>
		 *          var myBitmap:QBitmap = new QBitmap({embed:new _bitmapTest()}, this);
		 *      </code>
		 */
		public function QBitmap(displayConfig:Object = null, displayParent:DisplayObjectContainer = null) {
			// if config is not defined, prepare it
			var c:Object = displayConfig == null ? new Object() : displayConfig;

			super();

			// Bitmap overrides and custom config
			if(c.embed) {
				if(c.embed is Bitmap) {
					this.bitmapData = c.embed.bitmapData;
				} else if(c.embed is BitmapData) {
					this.bitmapData = c.embed;
				} else {
					throw new TypeError("Invalid embed object");
				}
			}

			// assign parameters
			ObjectUtils.assign(this, c);

			// add child if requested
			if(displayParent != null) displayParent.addChild(this);

			// set position and size if needed
			if(c.width != null) this.width = c.width;
			if(c.height != null) this.height = c.height;
			if(c.size != null) this.size = c.size;
			if(c.position != null) this.position = c.position;
			if(c.positionAndSize != null) this.positionAndSize = c.positionAndSize;
		}



		/**
		 * Destroys the QBitmap instance and frees it for GC.
		 * Placeholder.
		 */
		public function destroy():void {
			this.bitmapData = null;
			this.filters = null;
		}



		/**
		 * Moves to the specified position.
		 * @param p New position as Point
		 */
		public function set position(p:Point):void {
			this.x = p.x;
			this.y = p.y;
		}



		/**
		 * Rescales to new size.
		 * @param size New size as Size
		 * @see Size
		 */
		public function set size(size:Size):void {
			this.width = size.width;
			this.height = size.height;
		}



		/**
		 * Set position and size at once to speed up things.
		 * @param rect Scale Rectangle
		 */
		public function set positionAndSize(rect:Rectangle):void {
			this.x = rect.x;
			this.y = rect.y;
			this.width = rect.width;
			this.height = rect.height;
		}



		/**
		 * Get current position as Point.
		 * @return Current position as Point
		 */
		public function get position():Point {
			return new Point(this.x, this.y);
		}



		/**
		 * Get current size as Size.
		 * @return Current size as Size
		 * @see Size
		 */
		public function get size():Size {
			return new Size(this.width, this.height);
		}



		/**
		 * Get current position and size as Rectangle.
		 * @return Current position and size as Rectangle
		 */
		public function get positionAndSize():Rectangle {
			return new Rectangle(this.x, this.y, this.width, this.height);
		}



		/**
		 * Get current global position as Point.
		 * @return Current global position as Point
		 */
		public function get globalPosition():Point {
			return parent.localToGlobal(new Point(this.x, this.y));
		}
	}
}
