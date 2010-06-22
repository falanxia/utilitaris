/*
 * Copyright (c) 2010 Vaclav Vancura (http://vaclav.vancura.org)
 */

package com.falanxia.utilitaris.antizmrd.disablemethods {

	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.text.TextField;
	import flash.text.TextFormat;


	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
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

		/**
		 * Constructor.
		 */
		public function SimpleMessageDisable(stage:Stage, message:String, messageTextFormat:TextFormat, disablerColor:uint = 0, disablerAlpha:Number = 0.9) {
			this.stage = stage;
			this.message = message;
			this.disablerColor = disablerColor;
			this.disablerAlpha = disablerAlpha;
			this.textFormat = messageTextFormat;
		}



		public function doDisable():void {
			disabler = new Sprite();
			disabler.graphics.beginFill(disablerColor);
			disabler.graphics.drawRect(0,0,stage.stageWidth, stage.stageHeight);
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
