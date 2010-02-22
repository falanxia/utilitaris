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
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;



	/**
	 * Quick texture filled rectangle.
	 *
	 * @todo Documentation (original by Bit-101)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura (<a href="http://vaclav.vancura.org">vaclav.vancura.org</a>, <a href="http://twitter.com/vancura">@vancura</a>)
	 * @since 1.1
	 */
	public class QTexture {


		private var bmpd:BitmapData;



		/**
		 * Constructor.
		 * @todo Documentation
		 */
		public function QTexture(bmpd:BitmapData) {
			bmpd = bmpd;
		}



		/**
		 * @todo Documentation
		 * @param source
		 * @param matrix
		 * @param colorTransform
		 * @param blendMode
		 * @param clipRect
		 * @param smoothing
		 */
		public function draw(source:DisplayObject, matrix:Matrix = null, colorTransform:ColorTransform = null, blendMode:String = null,
		                     clipRect:Rectangle = null, smoothing:Boolean = false):void {
			bmpd.draw(source, matrix, colorTransform, blendMode, clipRect, smoothing);

			if(matrix == null) matrix = new Matrix();

			// get ref to object
			var sourceDO:DisplayObject = DisplayObject(source);

			// take not of original matrix and parent
			var origMatrix:Matrix = sourceDO.transform.matrix;
			var origParent:DisplayObjectContainer = sourceDO.parent;

			// add to temp parent and use matrix parameter
			var tempParent:Sprite = new Sprite();
			tempParent.addChild(sourceDO);
			sourceDO.transform.matrix = matrix;

			// where is it now?
			var rect:Rectangle = sourceDO.getBounds(tempParent);

			// put everything back the way it was
			tempParent.removeChild(sourceDO);
			if(origParent != null) origParent.addChild(sourceDO);
			sourceDO.transform.matrix = origMatrix;

			var temp:Matrix;
			if(rect.right > bmpd.width) {
				// object extends off bitmap to the right, so draw it again, one screen to the left
				temp = matrix.clone();
				temp.tx -= bmpd.width;

				bmpd.draw(source, temp, colorTransform, blendMode, clipRect, smoothing);

				if(rect.bottom > bmpd.height) {
					// it may ALSO extend off the top, so draw one screen to the left AND one screen up
					temp.ty -= bmpd.height;
					bmpd.draw(source, temp, colorTransform, blendMode, clipRect, smoothing);
				}
				if(rect.top < 0) {
					// it may ALSO extend off the bottom, so draw one screen to the left AND one screen down
					temp.ty += bmpd.height;
					bmpd.draw(source, temp, colorTransform, blendMode, clipRect, smoothing);
				}
			}

			if(rect.left < 0) {
				// object extends off bitmap to the left, so draw it again, one screen to the right
				temp = matrix.clone();
				temp.tx += bmpd.width;
				bmpd.draw(source, temp, colorTransform, blendMode, clipRect, smoothing);

				if(rect.bottom > bmpd.height) {
					// it may ALSO extend off the top, so draw one screen to the right AND one screen up
					temp.ty -= bmpd.height;
					bmpd.draw(source, temp, colorTransform, blendMode, clipRect, smoothing);
				}
				if(rect.top < 0) {
					// it may ALSO extend off the bottom, so draw one screen to the right AND one screen down
					temp.ty += bmpd.height;
					bmpd.draw(source, temp, colorTransform, blendMode, clipRect, smoothing);
				}
			}

			if(rect.bottom > bmpd.height) {
				// object extends off bitmap to the bottom, so draw it again, one screen up
				// left and right are already taken care of
				temp = matrix.clone();
				temp.ty -= bmpd.height;
				bmpd.draw(source, temp, colorTransform, blendMode, clipRect, smoothing);
			}
			if(rect.top < 0) {
				// object extends off bitmap to the bottom, so draw it again, one screen up
				// left and right are already taken care of
				temp = matrix.clone();
				temp.ty += bmpd.height;
				bmpd.draw(source, temp, colorTransform, blendMode, clipRect, smoothing);
			}
		}
	}
}
