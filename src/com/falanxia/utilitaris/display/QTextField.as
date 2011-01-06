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
	import com.falanxia.utilitaris.types.Size;
	import com.falanxia.utilitaris.utils.ObjectUtils;

	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.AntiAliasType;
	import flash.text.GridFitType;
	import flash.text.TextField;
	import flash.text.TextFieldType;



	/**
	 * Quick TextField.
	 * Quick creation of TextField with initial settings.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @since 1.0
	 * @see QBitmap
	 * @see QSprite
	 * @see QVideo
	 */
	public class QTextField extends TextField {



		/**
		 * Constructor.
		 * All parameters from the config Object are parsed and applied to the newly created TextField.
		 * @usageNote Additionally these set to non-default settings to make common tasks easier (if not overridden by the config parameter)
		 *      <ul>
		 *          <li>antiAliasType - set to AntiAliasType.ADVANCED</li>
		 *          <li>condenseWhite - set to true</li>
		 *          <li>embedFonts - set to true</li>
		 *          <li>gridFitType - set to GridFitType.SUBPIXEL</li>
		 *          <li>mouseEnabled - set to false to prevent scrolling via mouse wheel, don't forget to enable it in case you need to use anchors in text</li>
		 *          <li>multiline - set to true</li>
		 *          <li>selectable - set to false</li>
		 *          <li>type - set to TextFieldType.DYNAMIC</li>
		 *          <li>wordWrap - set to true</li>
		 *      </ul>
		 * @param displayConfig Config Object
		 * @param displayParent Parent DisplayObjectContainer
		 * @example Example code:
		 *      <code>
		 *		    var myText:QTextField = new QTextField(x:100, y:50, width:300, embedFonts:false, text:'Lorem ipsum dolor sit amet'});
		 *		    addChild(myText);
		 *      </code>
		 * @example Another example directly adding new QTextField to this DisplayObjectContainer:
		 *      <code>
		 *          var myText:QTextField = new QTextField({}, this);
		 *      </code>
		 */
		public function QTextField(displayConfig:Object = null, displayParent:DisplayObjectContainer = null) {
			// create default settings
			var d:Object = {
				antiAliasType:AntiAliasType.ADVANCED,
				condenseWhite:true,
				embedFonts:true,
				gridFitType:GridFitType.SUBPIXEL,
				mouseEnabled:true,
				multiline:true,
				selectable:false,
				type:TextFieldType.DYNAMIC,
				wordWrap:true
			};

			// if config is not defined, prepare it
			var c:Object = displayConfig == null ? new Object() : displayConfig;

			super();

			// assign parameters
			ObjectUtils.assign(d, c);
			ObjectUtils.assign(this, d);

			// add child if requested
			if(displayParent != null) displayParent.addChild(this);

			// set position and size if needed
			if(c.size != null) this.size = c.size;
			if(c.position != null) this.position = c.position;
		}



		/**
		 * Destroys the QTextField instance and frees it for GC.
		 * Placeholder.
		 */
		public function destroy():void {
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
	}
}
