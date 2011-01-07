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

package com.falanxia.utilitaris.interfaces {
	import com.falanxia.utilitaris.types.Size;

	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	import flash.geom.Rectangle;



	/**
	 * Q* interface.
	 *
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 */
	public interface IQ extends IEventDispatcher {


		/**
		 * Destroys the QSprite and frees it for GC.
		 */
		function destroy():void;



		/**
		 * Moves to the specified position.
		 * @param p New position as Point
		 */
		function set position(p:Point):void;



		/**
		 * Rescales to new size.
		 * @param size New size as Size
		 * @see Size
		 */
		function set size(size:Size):void;



		/**
		 * Set position and size at once to speed up things.
		 * @param rect Scale Rectangle
		 */
		function set positionAndSize(rect:Rectangle):void;



		/**
		 * Get current position as Point.
		 * @return Current position as Point
		 */
		function get position():Point;



		/**
		 * Get current global position as Point.
		 * @return Current global position as Point
		 */
		function get globalPosition():Point;



		/**
		 * Get current size as Size.
		 * @return Current size as Size
		 * @see Size
		 */
		function get size():Size;



		/**
		 * Get current position and size as Rectangle.
		 * @return Current position and size as Rectangle
		 */
		function get positionAndSize():Rectangle;


	}
}
