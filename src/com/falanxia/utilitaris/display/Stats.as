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
	import com.falanxia.utilitaris.types.*;
	import com.falanxia.utilitaris.utils.*;

	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import flash.system.*;
	import flash.text.*;
	import flash.utils.*;



	/**
	 * Hi-ReS! Stats.
	 *
	 * @implementationNote Original by <a href="http://www.mrdoob.com">Mr.doob</a>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @since 1.0
	 */
	public class Stats extends QSprite {


		[Embed(source="uni05_53.ttf", fontName="uni0553", embedAsCFF="false", mimeType="application/x-font", unicodeRange="U+0030-U+0039,U+002E,U+0046,U+0050,U+0053,U+004D,U+004D,U+0045,U+0020,U+003A,U+002F,U+0053,U+004D,U+0048,U+0044")]
		public static var fontUni0553:Class;

		private static const WIDTH:Number = 80;

		private var fpsGraphBD:BitmapData;
		private var memGraphBD:BitmapData;
		private var msGraphBD:BitmapData;
		private var fpsGraphBM:QBitmap;
		private var memGraphBM:QBitmap;
		private var msGraphBM:QBitmap;
		private var textFormat:TextFormat = new TextFormat("uni0553", 8);
		private var fpsText:QTextField;
		private var msText:QTextField;
		private var memText:QTextField;
		private var runtimeText:QTextField;
		private var fps:int;
		private var timer:int;
		private var ms:int;
		private var msPrev:int = 0;
		private var mem:Number = 0;



		/**
		 * Constructor.
		 * @param config Config Object
		 * @param parent Parent DisplayObjectContainer
		 */
		public function Stats(config:Object = null, parent:DisplayObjectContainer = null) {
			// create parent QSprite
			super(config, parent);

			// add components
			fpsGraphBD = new BitmapData(WIDTH, 50, false, 0x000000);
			msGraphBD = new BitmapData(WIDTH, 50, false, 0x000000);
			memGraphBD = new BitmapData(WIDTH, 50, false, 0x000000);

			fpsGraphBM = new QBitmap({bitmapData: fpsGraphBD, y:27, alpha:0.33, blendMode:BlendMode.SCREEN});
			msGraphBM = new QBitmap({bitmapData: msGraphBD, y:27, alpha:0.33, blendMode:BlendMode.SCREEN});
			memGraphBM = new QBitmap({bitmapData: memGraphBD, y:27, alpha:0.33, blendMode:BlendMode.SCREEN});

			fpsText = new QTextField({defaultTextFormat:textFormat, antiAliasType:AntiAliasType.NORMAL, y:-3, size:new Rectangle(0, 0, WIDTH, 10), textColor:0xFFFF00});
			msText = new QTextField({defaultTextFormat:textFormat, antiAliasType:AntiAliasType.NORMAL, y:5, size:new Rectangle(0, 0, WIDTH, 10), textColor:0x00FF00});
			memText = new QTextField({defaultTextFormat:textFormat, antiAliasType:AntiAliasType.NORMAL, y:13, size:new Rectangle(0, 0, WIDTH, 10), textColor:0x00FFFF});
			runtimeText = new QTextField({defaultTextFormat:textFormat, antiAliasType:AntiAliasType.NORMAL, y:75, size:new Rectangle(0, 0, WIDTH, 10), textColor:0xF0F0F0});

			// draw background
			DisplayUtils.drawRect(this, new Rectangle(0, 0, WIDTH, 27 + 63), new RGBA(0, 0, 0, 255 * 0.75));

			// add to display list
			DisplayUtils.addChildren(this, fpsGraphBM, msGraphBM, memGraphBM, fpsText, msText, memText, runtimeText);

			// set visual properties
			this.doubleClickEnabled = true;

			// add event listeners
			this.addEventListener(MouseEvent.CLICK, onMouseClick, false, 0, true);
			this.addEventListener(MouseEvent.DOUBLE_CLICK, onMouseDoubleclick, false, 0, true);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage, false, 0, true);
		}



		/**
		 * Destroys the QBitmap instance and frees it for GC.
		 * Placeholder.
		 */
		override public function destroy():void {
			// set visual properties
			this.visible = false;

			// remove event listeners
			this.removeEventListener(MouseEvent.CLICK, onMouseClick);
			this.removeEventListener(MouseEvent.DOUBLE_CLICK, onMouseDoubleclick);
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);

			// remove from display list
			DisplayUtils.removeChildren(this, fpsGraphBM, msGraphBM, memGraphBM, fpsText, msText, memText, runtimeText);

			// destroy components
			fpsGraphBD.dispose();
			msGraphBD.dispose();
			memGraphBD.dispose();
			fpsGraphBM.destroy();
			msGraphBM.destroy();
			memGraphBM.destroy();
			fpsText.destroy();
			msText.destroy();
			memText.destroy();
		}



		private function onAddedToStage(e:Event):void {
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame, false, 0, true);
		}



		private function onRemovedFromStage(e:Event):void {
			this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}



		private function onMouseClick(e:MouseEvent):void {
			if(this.mouseY > this.height * 0.35) {
				stage.frameRate--;
			}
			else {
				stage.frameRate++;
			}

			fpsText.text = "FPS: " + fps + "/" + stage.frameRate;
		}



		private function onMouseDoubleclick(e:MouseEvent):void {
			System.gc();
			System.gc();
		}



		private function onEnterFrame(e:Event):void {
			timer = getTimer();
			fps++;

			if(timer - 1000 > msPrev) {
				msPrev = timer;
				mem = Number((System.totalMemory / 1048576).toFixed(3));

				var f:uint = Math.min(50, 50 / stage.frameRate * fps);
				var t:uint = ((timer - ms ) >> 1);
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
				runtimeText.text = StringUtils.humanizeTime(getTimer() / 1000, "|:?=%dS", "|:?=%dM", "|:?=%dH", "|:?=%dD");

				fps = 0;
			}

			msText.text = "MS: " + (timer - ms);

			ms = timer;
		}
	}
}
