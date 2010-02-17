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
	 * @author Vaclav Vancura (<a href="http://vaclav.vancura.org">vaclav.vancura.org</a>, <a href="http://twitter.com/vancura">@vancura</a>)
	 * @since 1.0
	 */
	public class Stats extends QSprite {


		[Embed(source='uni05_53.ttf', fontName='uni0553', mimeType='application/x-font', unicodeRange='U+0030-U+0039,U+002E,U+0046,U+0050,U+0053,U+004D,U+004D,U+0045,U+0020,U+003A,U+002F')]
		private static var _fontUni0553:Class;

		private static const _WIDTH:Number = 80;

		private var _fpsGraphBD:BitmapData;
		private var _memGraphBD:BitmapData;
		private var _msGraphBD:BitmapData;

		private var _fpsGraphBM:Bitmap;
		private var _memGraphBM:Bitmap;
		private var _msGraphBM:Bitmap;

		private var _textFormat:TextFormat = new TextFormat('uni0553', 8);
		private var _fpsText:QTextField;
		private var _msText:QTextField;
		private var _memText:QTextField;
		private var _fps:int;
		private var _timer:int;
		private var _ms:int;
		private var _msPrev:int = 0;
		private var _mem:Number = 0;



		/**
		 * Constructor.
		 * @param config Config {@code Object}
		 * @param parent Parent {@code DisplayObjectContainer}
		 */
		public function Stats(config:Object = null, parent:DisplayObjectContainer = null) {
			// create parent QSprite
			super(config, parent);

			_fpsGraphBD = new BitmapData(_WIDTH, 50, false, 0x000000);
			_msGraphBD = new BitmapData(_WIDTH, 50, false, 0x000000);
			_memGraphBD = new BitmapData(_WIDTH, 50, false, 0x000000);
			_fpsGraphBM = new QBitmap({bitmapData: _fpsGraphBD, y:27, alpha:0.33, blendMode:BlendMode.SCREEN});
			_msGraphBM = new QBitmap({bitmapData: _msGraphBD, y:27, alpha:0.33, blendMode:BlendMode.SCREEN});
			_memGraphBM = new QBitmap({bitmapData: _memGraphBD, y:27, alpha:0.33, blendMode:BlendMode.SCREEN});
			_fpsText = new QTextField({defaultTextFormat: _textFormat, antiAliasType:AntiAliasType.NORMAL, y:-3, width:_WIDTH, height:10, textColor:0xFFFF00});
			_msText = new QTextField({defaultTextFormat: _textFormat, antiAliasType:AntiAliasType.NORMAL, y:5, width:_WIDTH, height:10, textColor:0x00FF00});
			_memText = new QTextField({defaultTextFormat: _textFormat, antiAliasType:AntiAliasType.NORMAL, y:13, width:_WIDTH, height:10, textColor:0x00FFFF});

			DisplayUtils.drawRect(this, new Rectangle(0, 0, _WIDTH, 27 + 50), new RGBA(0, 0, 0, 255 * 0.75));

			DisplayUtils.addChildren(this, _fpsGraphBM, _msGraphBM, _memGraphBM, _fpsText, _msText, _memText);

			addEventListener(MouseEvent.CLICK, _onMouseClick);
			addEventListener(Event.ENTER_FRAME, _onEnterFrame);
		}



		/* ★ EVENT LISTENERS ★ */


		/**
		 * Mouse clicked event listener.
		 */
		private function _onMouseClick(e:MouseEvent):void {
			if(this.mouseY > this.height * 0.35) stage.frameRate--;
			else stage.frameRate++;

			_fpsText.text = 'FPS: ' + _fps + '/' + stage.frameRate;
		}



		/**
		 * Enter frame event listener.
		 */
		private function _onEnterFrame(e:Event):void {
			_timer = getTimer();
			_fps++;

			if(_timer - 1000 > _msPrev) {
				_msPrev = _timer;
				//noinspection NestedFunctionCallJS
				_mem = Number((System.totalMemory / 1048576).toFixed(3));

				var f:uint = Math.min(50, 50 / stage.frameRate * _fps);
				var t:uint = ((_timer - _ms ) >> 1);

				//noinspection NestedFunctionCallJS
				var m:uint = Math.min(50, Math.sqrt(Math.sqrt(_mem * 5000))) - 2;

				_fpsGraphBD.scroll(1, 0);
				_msGraphBD.scroll(1, 0);
				_memGraphBD.scroll(1, 0);

				var r1:Rectangle = new Rectangle(0, 50 - f, 1, f);
				var r2:Rectangle = new Rectangle(0, 50 - t, 1, t);
				var r3:Rectangle = new Rectangle(0, 50 - m, 1, m);

				_fpsGraphBD.fillRect(r1, 0xFFFF00);
				_msGraphBD.fillRect(r2, 0x00FF00);
				_memGraphBD.fillRect(r3, 0x00FFFF);

				_fpsText.text = 'FPS: ' + _fps + '/' + stage.frameRate;
				_memText.text = 'MEM: ' + _mem;

				_fps = 0;
			}

			_msText.text = 'MS: ' + (_timer - _ms);
			_ms = _timer;
		}
	}
}
