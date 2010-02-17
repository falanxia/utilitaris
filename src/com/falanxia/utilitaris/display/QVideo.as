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

	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.media.Video;



	/**
	 * Quick Video.
	 * Quick creation of {@code Video} with initial settings.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura (<a href="http://vaclav.vancura.org">vaclav.vancura.org</a>, <a href="http://twitter.com/vancura">@vancura</a>)
	 * @since 1.0
	 * @see QBitmap
	 * @see QSprite
	 * @see QTextField
	 */
	public class QVideo extends Video {



		/**
		 * Constructor.
		 * All parameters from the {@code config} Object are parsed and applied to the newly created {@code Video}.
		 * @usageNote Additionally these set to non-default settings to make common tasks easier (if not overridden by the {@code config} parameter)
		 *      <ul>
		 *          <li>{@code deblocking} - set to 5</li>
		 *          <li>{@code smoothing} - set to {@code true}</li>
		 *      </ul>
		 * @param width {@code Video} width
		 * @param height {@code Video} height
		 * @param config Config {@code Object}
		 * @param parent Parent {@code DisplayObjectContainer}
		 * @example Example code:
		 *      <code>
		 *		    var myVideo:QVideo = new QVideo(400, 300, {x:100, y:50});
		 *		    addChild(myVideo);
		 *      </code>
		 * @example Another example directly adding new QVideo to {@code this} {@code DisplayObjectContainer}:
		 *      <code>
		 *          var myVideo:QVideo = new QVideo(400, 300, {}, this);
		 *      </code>
		 */
		public function QVideo(width:Number, height:Number, config:Object = null, parent:DisplayObjectContainer = null) {
			// create default settings
			var d:Object = {
				deblocking:5,
				smoothing:true
			};

			// if config is not defined, prepare it
			var c:Object;
			if(config == null) c = new Object();
			else c = config;

			try {
				super(c.width, c.height);
			}
			catch(err:Error) {
				if(c.width == undefined) throw new Error("Video width undefined (" + err.message + ')');
				if(c.height == undefined) throw new Error("Video height undefined (" + err.message + ')');
			}

			// assign parameters
			ObjectUtils.assign(d, c);
			ObjectUtils.assign(this, d);

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
