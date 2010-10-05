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

package com.falanxia.utilitaris.antizmrd.disablemethods {
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.text.TextField;
	import flash.text.TextFormat;



	/**
	 * SimpleMessageDisable.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class SimpleMessageDisable implements IDisableMethod {


		private var stage:Stage;
		private var message:String;
		private var disablerColor:uint;
		private var disablerAlpha:Number;
		private var textFormat:TextFormat;

		private var disabler:Sprite;
		private var textField:TextField;



		public function SimpleMessageDisable(stage:Stage, message:String, messageTextFormat:TextFormat, disablerColor:uint = 0,
		                                     disablerAlpha:Number = 0.9) {
			this.stage = stage;
			this.message = message;
			this.disablerColor = disablerColor;
			this.disablerAlpha = disablerAlpha;
			this.textFormat = messageTextFormat;
		}



		public function doDisable():void {
			disabler = new Sprite();
			disabler.graphics.beginFill(disablerColor);
			disabler.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			disabler.graphics.endFill();

			textField = new TextField();
			textField.defaultTextFormat = textFormat;
			textField.width = stage.stageWidth;
			textField.wordWrap = true;
			textField.selectable = false;
			textField.multiline = true;
			textField.text = this.message;
			textField.x = stage.stageWidth / 2 - textField.textWidth / 2;
			textField.y = stage.stageHeight / 2 - textField.textHeight / 2;

			disabler.addChild(textField);
			stage.addChild(disabler);
		}



		public function destroy():void {
			stage = null;
			message = null;
			textFormat = null;
		}
	}
}
