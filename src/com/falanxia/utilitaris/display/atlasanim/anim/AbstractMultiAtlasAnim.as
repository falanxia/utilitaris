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

package com.falanxia.utilitaris.display.atlasanim.anim {
	import com.falanxia.utilitaris.display.atlasanim.interfaces.*;

	import flash.display.*;
	import flash.geom.*;



	/**
	 * Abstract multi atlas animation.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class AbstractMultiAtlasAnim extends Sprite {

		protected var canvas:Bitmap;
		protected var canvasBD:BitmapData;
		protected var director:IAtlasDirector;
		protected var frameWidth:Number;
		protected var frameHeight:Number;
		protected var atlases:Vector.<BitmapData>;
		protected var atlasesLengths:Array;
		protected var frame:int;
		protected var maxFrame:uint;

		public function AbstractMultiAtlasAnim(width:Number, height:Number, atlases:Vector.<BitmapData>, atlasesLengths:Array, atlasDirector:IAtlasDirector) {
			this.frameWidth = width;
			this.frameHeight = height;
			this.atlases = atlases;
			this.atlasesLengths = atlasesLengths;
			this.director = atlasDirector;

			maxFrame += atlasesLengths[0];
			for(var i:int = 1; i < atlasesLengths.length; i++) {
				maxFrame += atlasesLengths[i] + 1;
			}

			init();
		}



		public function destroy():void {
			canvas = null;
			canvasBD.dispose();
			canvasBD = null;
			director = null;
			atlases = null;
			atlasesLengths = null;
		}



		protected function init():void {
			canvasBD = new BitmapData(frameWidth, frameHeight, true, 0x00000000);
			canvas = new Bitmap(canvasBD);

			addChild(canvas);
		}



		protected function drawFrame(frameNum:uint):void {
			var atlas:BitmapData = atlases[0];

			this.canvasBD.lock();

			//FIXME Too complex, cud be simplified

			var n:int = atlasesLengths[0];
			var i:int;

			while(frameNum > n) {
				i++;
				n += atlasesLengths[i] + 1;
				atlas = atlases[i];
			}

			if(i > 0) {
				n -= frameNum;
				n = atlasesLengths[i] - n;
			}
			else {
				n = frameNum;
			}

			var y:Number = int(n * frameWidth / atlas.width);
			var x:Number = n - y * (atlas.width / frameWidth);

			canvasBD.copyPixels(atlas, new Rectangle(x * frameWidth, y * frameHeight, frameWidth, frameHeight), new Point(0, 0));

			this.canvasBD.unlock();

			/*
			 canvasBD.setPixels(new Rectangle(0, 0, frameWidth, frameHeight),
			 atlas.getPixels(new Rectangle(x*frameWidth, y*frameHeight, frameWidth, frameHeight)));
			 */
		}
	}
}
