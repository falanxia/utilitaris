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
	import flash.display.*;
	import flash.geom.*;



	/**
	 * Scalable Bitmap - Sprite container.
	 *
	 * @author Didier Brun (<a href="http://www.bytearray.org">bytearray.org</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class ScaleBitmapSprite extends QSprite {


		private var _width:Number;
		private var _height:Number;
		private var _innerRect:Rectangle;
		private var _outerRect:Rectangle;
		private var _bitmapData:BitmapData;

		private var outerWidth:Number;
		private var outerHeight:Number;
		private var minWidth:Number;
		private var minHeight:Number;



		/**
		 * Constructor.
		 * @param bitmapData Source BitmapData
		 * @param innerRect Inner Rectangle
		 * @param outerRect Outer Rectangle
		 * @param config Config Object
		 * @param parent Parent DisplayObjectContainer
		 */
		function ScaleBitmapSprite(bitmapData:BitmapData = null, innerRect:Rectangle = null, outerRect:Rectangle = null, config:Object = null, parent:DisplayObjectContainer = null
				) {
			super(config, parent);

			// store parameters
			_bitmapData = bitmapData;
			_innerRect = innerRect;
			_outerRect = outerRect;

			// refresh
			refresh();

			// apply initial sizes if needed
			if(config != null && config.width != undefined) this.width = config.width;
			if(config != null && config.height != undefined) this.height = config.height;
		}



		/**
		 * Destroys the ScaleBitmapSprite instance and frees it for GC.
		 * Placeholder.
		 */
		override public function destroy():void {
			super.destroy();
		}



		/**
		 * Draw.
		 */
		public function draw():void {
			graphics.clear();

			ScaleBitmap.draw(_bitmapData, graphics, new Rectangle(0, 0, Math.floor(_width + outerWidth), Math.floor(_height + outerHeight)), _innerRect, _outerRect);
		}



		/**
		 * Set all data at once to speed things up.
		 * If you don't need a certain parameter, just use null instead.
		 * @param bitmapData New BitmapData (use null if you don't want to set it)
		 * @param innerRect New inner Rectangle (use null if you don't want to set it)
		 * @param outerRect New outer Rectangle (use null if you don't want to set it)
		 */
		public function setData(bitmapData:BitmapData = null, innerRect:Rectangle = null, outerRect:Rectangle = null):void {
			if(bitmapData != null) _bitmapData = bitmapData;
			if(innerRect != null) _innerRect = innerRect;
			if(outerRect != null) _outerRect = outerRect;

			refresh();
		}



		/**
		 * Get width.
		 * @return Width
		 */
		override public function get width():Number {
			return _width;
		}



		/**
		 * Set width.
		 * @param value Width
		 */
		override public function set width(value:Number):void {
			_width = Math.max(value, minWidth);

			draw();
		}



		/**
		 * Get height.
		 * @return Height
		 */
		override public function get height():Number {
			return _height;
		}



		/**
		 * Set height.
		 * @param value Height
		 */
		override public function set height(value:Number):void {
			_height = Math.max(value, minHeight);

			draw();
		}



		/**
		 * Get BitmapData
		 * @return BitmapData
		 */
		public function get bitmapData():BitmapData {
			return _bitmapData;
		}



		/**
		 * Set BitmapData
		 * @param value BitmapData
		 */
		public function set bitmapData(value:BitmapData):void {
			_bitmapData = value;

			draw();
		}



		/**
		 * Get inner Rectangle.
		 * @return Inner Rectangle
		 */
		public function get innerRect():Rectangle {
			return _innerRect;
		}



		/**
		 * Set inner Rectangle.
		 * Calls refresh() to recount data (slows down, so if you need to setup more things at once, use setData() instead.
		 * @param value Inner Rectangle
		 */
		public function set innerRect(value:Rectangle):void {
			_innerRect = value;
			refresh();
		}



		/**
		 * Get inner Rectangle.
		 * @return Inner Rectangle
		 */
		public function get outerRect():Rectangle {
			return _outerRect;
		}



		/**
		 * Set outer Rectangle.
		 * Calls refresh() to recount data (slows down, so if you need to setup more things at once, use setData() instead.
		 * @param value Outer Rectangle
		 */
		public function set outerRect(value:Rectangle):void {
			_outerRect = value;
			refresh();
		}



		private function refresh():void {
			// TODO: What to do when calling refresh AFTER data (bitmapData and innerRect) were nulled?

			if(_innerRect != null && _bitmapData != null) {
				// refresh only when data supplied

				if(_outerRect == null) {
					// outer rectangle is undefined, copy it from inner rectangle
					_width = _innerRect.width;
					_height = _innerRect.height;
					outerWidth = 0;
					outerHeight = 0;
				}
				else {
					// both outer and inner rectangles are defined
					_width = _outerRect.width;
					_height = _outerRect.height;
					outerWidth = bitmapData.width - _outerRect.width;
					outerHeight = bitmapData.height - _outerRect.height;
				}

				// set minimal width and height
				minWidth = bitmapData.width - _innerRect.width - outerWidth;
				minHeight = bitmapData.height - _innerRect.height - outerHeight;

				// initial draw
				draw();
			}
		}
	}
}
