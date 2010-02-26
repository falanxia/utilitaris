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
	import com.falanxia.utilitaris.types.RGBA;
	import com.falanxia.utilitaris.utils.DisplayUtils;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.system.System;
	import flash.text.AntiAliasType;
	import flash.text.TextFormat;
	import flash.utils.getTimer;



	/**
	 * Hi-ReS! Stats.
	 *
	 * @implementationNote Original by <a href="http://www.mrdoob.com">Mr.doob</a>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. vaclav@falanxia.com
	 * @since 1.0
	 */
	public class Stats extends QSprite {


		[Embed(source="uni05_53.ttf", fontName="uni0553", mimeType="application/x-font", unicodeRange="U+0030-U+0039,U+002E,U+0046,U+0050,U+0053,U+004D,U+004D,U+0045,U+0020,U+003A,U+002F")]
		public static var fontUni0553:Class;

		private static const WIDTH:Number = 80;

		private var fpsGraphBD:BitmapData;
		private var memGraphBD:BitmapData;
		private var msGraphBD:BitmapData;
		private var fpsGraphBM:Bitmap;
		private var memGraphBM:Bitmap;
		private var msGraphBM:Bitmap;
		private var textFormat:TextFormat = new TextFormat("uni0553", 8);
		private var fpsText:QTextField;
		private var msText:QTextField;
		private var memText:QTextField;
		private var fps:int;
		private var timer:int;
		private var ms:int;
		private var msPrev:int = 0;
		private var mem:Number = 0;



		/**
		 * Constructor.
		 * @param config Config {@code Object}
		 * @param parent Parent {@code DisplayObjectContainer}
		 */
		public function Stats(config:Object = null, parent:DisplayObjectContainer = null) {
			// create parent QSprite
			super(config, parent);

			fpsGraphBD = new BitmapData(WIDTH, 50, false, 0x000000);
			msGraphBD = new BitmapData(WIDTH, 50, false, 0x000000);
			memGraphBD = new BitmapData(WIDTH, 50, false, 0x000000);
			fpsGraphBM = new QBitmap({bitmapData: fpsGraphBD, y:27, alpha:0.33, blendMode:BlendMode.SCREEN});
			msGraphBM = new QBitmap({bitmapData: msGraphBD, y:27, alpha:0.33, blendMode:BlendMode.SCREEN});
			memGraphBM = new QBitmap({bitmapData: memGraphBD, y:27, alpha:0.33, blendMode:BlendMode.SCREEN});
			fpsText = new QTextField({defaultTextFormat: textFormat, antiAliasType:AntiAliasType.NORMAL, y:-3, width:WIDTH, height:10, textColor:0xFFFF00});
			msText = new QTextField({defaultTextFormat: textFormat, antiAliasType:AntiAliasType.NORMAL, y:5, width:WIDTH, height:10, textColor:0x00FF00});
			memText = new QTextField({defaultTextFormat: textFormat, antiAliasType:AntiAliasType.NORMAL, y:13, width:WIDTH, height:10, textColor:0x00FFFF});

			DisplayUtils.drawRect(this, new Rectangle(0, 0, WIDTH, 27 + 50), new RGBA(0, 0, 0, 255 * 0.75));

			DisplayUtils.addChildren(this, fpsGraphBM, msGraphBM, memGraphBM, fpsText, msText, memText);

			addEventListener(MouseEvent.CLICK, onMouseClick);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}



		/* ★ EVENT LISTENERS ★ */


		/**
		 * Mouse clicked event listener.
		 */
		private function onMouseClick(e:MouseEvent):void {
			if(this.mouseY > this.height * 0.35) stage.frameRate--;
			else stage.frameRate++;

			fpsText.text = "FPS: " + fps + "/" + stage.frameRate;
		}



		/**
		 * Enter frame event listener.
		 */
		private function onEnterFrame(e:Event):void {
			timer = getTimer();
			fps++;

			if(timer - 1000 > msPrev) {
				msPrev = timer;
				//noinspection NestedFunctionCallJS
				mem = Number((System.totalMemory / 1048576).toFixed(3));

				var f:uint = Math.min(50, 50 / stage.frameRate * fps);
				var t:uint = ((timer - ms ) >> 1);

				//noinspection NestedFunctionCallJS
				var m:uint = Math.min(50, Math.sqrt(Math.sqrt(mem * 5000))) - 2;

				fpsGraphBD.scroll(1, 0);
				msGraphBD.scroll(1, 0);
				memGraphBD.scroll(1, 0);

				var r1:Rectangle = new Rectangle(0, 50 - f, 1, f);
				var r2:Rectangle = new Rectangle(0, 50 - t, 1, t);
				var r3:Rectangle = new Rectangle(0, 50 - m, 1, m);

				fpsGraphBD.fillRect(r1, 0xFFFF00);
				msGraphBD.fillRect(r2, 0x00FF00);
				memGraphBD.fillRect(r3, 0x00FFFF);

				fpsText.text = "FPS: " + fps + "/" + stage.frameRate;
				memText.text = "MEM: " + mem;

				fps = 0;
			}

			msText.text = "MS: " + (timer - ms);
			ms = timer;
		}
	}
}
