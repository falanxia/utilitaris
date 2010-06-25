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

package com.falanxia.utilitaris.handlers {
	import com.falanxia.utilitaris.enums.*;

	import flash.display.*;
	import flash.events.*;
	import flash.ui.*;



	/**
	 * Game pad.
	 *
	 * @implementationNote Original <a href="http://github.com/iainlobb/Gamepad/blob/master/com/iainlobb/Gamepad.as">http://github.com/iainlobb/Gamepad/blob/master/com/iainlobb/Gamepad.as</a>
	 * @author Iain Lobb (<a href="http://blog.iainlobb.com">blog.iainlobb.com</a>)
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @since 1.0
	 */
	public class GamePad extends EventDispatcher {


		public var leftKey:uint = Keyboard.LEFT;
		public var rightKey:uint = Keyboard.RIGHT;
		public var downKey:uint = Keyboard.DOWN;
		public var upKey:uint = Keyboard.UP;
		public var fire1Key:uint = Keyboard.SPACE;
		public var fire2Key:uint = Keyboard.ENTER;

		private var _isCircle:Boolean;
		private var _autoStep:Boolean;
		private var _ease:Number;
		private var _up:Boolean;
		private var _down:Boolean;
		private var _left:Boolean;
		private var _right:Boolean;
		private var _upLeft:Boolean;
		private var _downLeft:Boolean;
		private var _upRight:Boolean;
		private var _downRight:Boolean;
		private var _fire1:Boolean;
		private var _fire2:Boolean;
		private var _any:Boolean;
		private var _x:Number = 0;
		private var _y:Number = 0;
		private var _angle:Number;

		private var targetX:Number = 0;
		private var targetY:Number = 0;
		private var rotation:Number;
		private var stage:Stage;



		/**
		 * Constructor.
		 * @param stage {@code Stage} reference
		 * @param isCircle Circlular shape
		 * @param ease Easing ratio
		 * @param autoStep Autostepping
		 */
		public function GamePad(stage:Stage, isCircle:Boolean, ease:Number = 0.2, autoStep:Boolean = true) {
			this._isCircle = isCircle;
			this._ease = ease;
			this.stage = stage;

			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp, false, 0, true);

			if(autoStep) stage.addEventListener(Event.ENTER_FRAME, onEnterFrame, false, 0, true);
		}



		/**
		 * Destructor.
		 */
		public function destroy():void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}



		/**
		 * Arrows mode.
		 */
		public function useArrows():void {
			leftKey = Keyboard.LEFT;
			rightKey = Keyboard.RIGHT;
			downKey = Keyboard.DOWN;
			upKey = Keyboard.UP;
		}



		/**
		 * WASD mode.
		 */
		public function useWASD():void {
			leftKey = KeyCodes.A;
			rightKey = KeyCodes.D;
			downKey = KeyCodes.S;
			upKey = KeyCodes.W;
		}



		/**
		 * QAOP mode.
		 */
		public function useQAOP():void {
			leftKey = KeyCodes.O;
			rightKey = KeyCodes.P;
			downKey = KeyCodes.A;
			upKey = KeyCodes.Q;
		}



		/**
		 * Step.
		 */
		public function step():void {
			_x += (targetX - _x) * _ease;
			_y += (targetY - _y) * _ease;
		}



		/**
		 * Get angle.
		 * @return Angle
		 */
		public function get angle():Number {
			return _angle;
		}



		/**
		 * Get X position.
		 * @return X position
		 */
		public function get x():Number {
			return _x;
		}



		/**
		 * Get Y position.
		 * @return Y position
		 */
		public function get y():Number {
			return _y;
		}



		/**
		 * Get up key status.
		 * @return Up key status
		 */
		public function get up():Boolean {
			return _up;
		}



		/**
		 * Get down key status.
		 * @return Down key status
		 */
		public function get down():Boolean {
			return _down;
		}



		/**
		 * Get left key status.
		 * @return Left key status
		 */
		public function get left():Boolean {
			return _left;
		}



		/**
		 * Get right key status
		 * @return Right key status
		 */
		public function get right():Boolean {
			return _right;
		}



		/**
		 * Get up + left keys status.
		 * @return Up + left key status
		 */
		public function get upLeft():Boolean {
			return _upLeft;
		}



		/**
		 * Get down + left key status.
		 * @return Down + left key status
		 */
		public function get downLeft():Boolean {
			return _downLeft;
		}



		/**
		 * Get up + right key status.
		 * @return Up + right key status
		 */
		public function get upRight():Boolean {
			return _upRight;
		}



		/**
		 * Get down + right key status.
		 * @return Down + right key status
		 */
		public function get downRight():Boolean {
			return _downRight;
		}



		/**
		 * Get fire 1 status.
		 * @return Fire status
		 */
		public function get fire1():Boolean {
			return _fire1;
		}



		/**
		 * Get fire 2 status.
		 * @return Fire 2 status
		 */
		public function get fire2():Boolean {
			return _fire2;
		}



		/**
		 * Get any key status.
		 * @return Any key status
		 */
		public function get any():Boolean {
			return _any;
		}



		/**
		 * Get circle mode status.
		 * @return Circle mode status
		 */
		public function get isCircle():Boolean {
			return _isCircle;
		}



		/**
		 * Set circle mode status.
		 * @param value Circle mode status
		 */
		public function set isCircle(value:Boolean):void {
			_isCircle = value;
		}



		/**
		 * Get auto stepping status.
		 * @return Auto stepping status
		 */
		public function get autoStep():Boolean {
			return _autoStep;
		}



		/**
		 * Set auto stepping status.
		 * @param value Auto stepping status
		 */
		public function set autoStep(value:Boolean):void {
			_autoStep = value;
		}



		/**
		 * Get easing ratio.
		 * @return Easing ratio
		 */
		public function get ease():Number {
			return _ease;
		}



		/**
		 * Set easing ratio.
		 * @param value Easing ratio
		 */
		public function set ease(value:Number):void {
			_ease = value;
		}



		private function onEnterFrame(e:Event):void {
			step();
		}



		private function onKeyDown(e:KeyboardEvent):void {
			switch(e.keyCode) {
				case upKey:
					_up = true;
					break;

				case downKey:
					_down = true;
					break;

				case leftKey:
					_left = true;
					break;

				case rightKey:
					_right = true;
					break;

				case fire1Key:
					_fire1 = true;
					break;

				case fire2Key:
					_fire2 = true;
					break;

				default:
					// Not a game key
					break;
			}

			updateState();
		}



		private function onKeyUp(e:KeyboardEvent):void {
			switch(e.keyCode) {
				case upKey:
					_up = false;
					break;

				case downKey:
					_down = false;
					break;

				case leftKey:
					_left = false;
					break;

				case rightKey:
					_right = false;
					break;

				case fire1Key:
					_fire1 = false;
					break;

				case fire2Key:
					_fire2 = false;
					break;

				default:
					// Not a game key
					break;
			}

			updateState();
		}



		private function updateState():void {
			_upLeft = _up && _left;
			_upRight = _up && _right;
			_downLeft = _down && _left;
			_downRight = _down && _right;

			_any = _up || _down || _right || _left;

			if(_up) {
				targetY = -1;
			}
			else {
				if(_down) {
					targetY = 1;
				}
				else {
					targetY = 0;
				}
			}

			if(_left) {
				targetX = -1;
			}
			else {
				if(_right) {
					targetX = 1;
				}
				else {
					targetX = 0;
				}
			}

			_angle = Math.atan2(targetX, targetY);

			rotation = _angle * 57.29577951308232;

			if(_isCircle && _any) {
				targetX = Math.sin(angle);
				targetY = Math.cos(angle);
			}

			step();
		}
	}
}
