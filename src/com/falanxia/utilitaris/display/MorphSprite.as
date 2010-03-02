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
	import com.greensock.TweenLite;
	import com.greensock.easing.Elastic;

	import flash.display.DisplayObjectContainer;



	/**
	 * Morphable {@code Sprite}.
	 * You can animate position and size of any extending {@code Class}.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. vaclav@falanxia.com
	 * @since 1.0
	 */
	public class MorphSprite extends QSprite {



		/** Default morphing {@code duration} in seconds */
		public static var defaultMorphDuration:Number = 0.75;

		/** Default morphing easing {@code Function} */
		public static var defaultMorphEase:Function = Elastic.easeOut;

		/** Default {@code width} change flag */
		public static var deaultfIsChangeWidthEnabled:Boolean = true;

		/** Default {@code height} change flag */
		public static var defaultIsChangeHeightEnabled:Boolean = true;

		/** Default {@code x} morphing flag */
		public static var defaultIsMorphXEnabled:Boolean = true;

		/** Default {@code y} morphing flag */
		public static var defaultIsMorphYEnabled:Boolean = true;

		/** Default {@code width} morphing flag */
		public static var defaultIsMorphWidthEnabled:Boolean = true;

		/** Default {@code height} morphing flag */
		public static var defaultIsMorphHeightEnabled:Boolean = true;

		/** Current morphing {@code duration} in seconds */
		public var morphDuration:Number;

		/** Current morphing easing {@code Function} */
		public var morphEase:Function;

		/** Current {@code width} change flag */
		public var isChangeWidthEnabled:Boolean;

		/** Current {@code height} change flag */
		public var isChangeHeightEnabled:Boolean;

		/** Current {@code x} morphing flag */
		public var isMorphXEnabled:Boolean;

		/** Current {@code y} morphing flag */
		public var isMorphYEnabled:Boolean;

		/** Current {@code width} morphing flag */
		public var isMorphWidthEnabled:Boolean;

		/** Current {@code height} morphing flag */
		public var isMorphHeightEnabled:Boolean;


		private var oldCacheAsBitmap:Boolean;
		private var initialProperties:Object;



		/**
		 * Constructor.
		 * @usageNote Possible {@code config} contents:
		 *      <ul>
		 *          <li>{@code morphDuration} - Morphing {@code duration} in seconds. If not defined, {@link MorphSprite#defaultMorphDuration} used instead.</li>
		 *          <li>{@code morphEase} - Morphing transition {@code Function}. If not defined, {@link MorphSprite#defaultMorphEase} used instead.</li>
		 *          <li>{@code isChangeWidthEnabled} - {@code width} change flag. If not defined, {@link MorphSprite#defaultIsChangeWidthEnabled} used instead.</li>
		 *          <li>{@code isChangeHeightEnabled} - {@code height} change flag. If not defined, {@link MorphSprite#defaultIsChangeHeightEnabled} used instead.</li>
		 *          <li>{@code isMorphXEnabled} - {@code x} morphing flag. If not defined, {@link MorphSprite#defaultIsMorphXEnabled} used instead.</li>
		 *          <li>{@code isMorphYEnabled} - {@code y} morphing flag. If not defined, {@link MorphSprite#defaultIsMorphYEnabled} used instead.</li>
		 *          <li>{@code isMorphWidthEnabled} - {@code width} morphing flag. If not defined, {@link MorphSprite#defaultIsMorphWidthEnabled} used instead.</li>
		 *          <li>{@code isMorphHeightEnabled} - {@code height} morphing flag. If not defined, {@link MorphSprite#defaultIsMorphHeightEnabled} used instead.</li>
		 *      </ul>
		 * @param config Config {@code Object}
		 * @param parent Parent {@code DisplayObjectContainer}
		 */
		public function MorphSprite(config:Object = null, parent:DisplayObjectContainer = null) {
			var c:Object;

			// create config value object
			if(config == null) c = new Object();
			else c = config;

			// create parent QSprite
			super(c, parent);

			// assign values
			morphDuration = (c.morphDuration == undefined) ? defaultMorphDuration : c.morphDuration;
			morphEase = (c.morphEase == undefined) ? defaultMorphEase : c.morphEase;
			isChangeWidthEnabled = (c.isChangeWidthEnabled == undefined) ? deaultfIsChangeWidthEnabled : c.isChangeWidthEnabled;
			isChangeHeightEnabled = (c.isChangeHeightEnabled == undefined) ? defaultIsChangeHeightEnabled : c.isChangeHeightEnabled;
			isMorphXEnabled = (c.isMorphXEnabled == undefined) ? defaultIsMorphXEnabled : c.isMorphXEnabled;
			isMorphYEnabled = (c.isMorphYEnabled == undefined) ? defaultIsMorphYEnabled : c.isMorphYEnabled;
			isMorphWidthEnabled = (c.isMorphWidthEnabled == undefined) ? defaultIsMorphWidthEnabled : c.isMorphWidthEnabled;
			isMorphHeightEnabled = (c.isMorphHeightEnabled == undefined) ? defaultIsMorphHeightEnabled : c.isMorphHeightEnabled;
		}



		/**
		 * Destroys the MorphSprite instance and frees it for GC
		 */
		public override function destroy():void {
			super.destroy();
			defaultMorphEase = null;
			morphEase = null;
			initialProperties = null;
		}


		/**
		 * Animate state change.
		 * Timing is taken from {@code morphDuration}, transition from {@code morphEase}.
		 * Follows status flags ({@link MorphSprite#isMorphXEnabled}, {@link MorphSprite#isMorphYEnabled}, {@link MorphSprite#isMorphWidthEnabled} and {@link MorphSprite#isMorphHeightEnabled}).
		 * @usageNote Possible config contents:
		 *      <ul>
		 *          <li>{@code x} - New {@code x} position</li>
		 *          <li>{@code y} - New {@code y} position</li>
		 *          <li>{@code width} - New {@code width}</li>
		 *          <li>{@code height} - New {@code height}</li>
		 *          <li>{@code morphEase} - easing {@code Function}</li>
		 *          <li>{@code morphDuration} - {@code duration} in seconds</li>
		 *      </ul>
		 * @param config Config {@code Object}
		 */
		//noinspection FunctionWithMoreThanThreeNegationsJS
		public function morph(config:Object):void {
			if(initialProperties == null) {
				initialProperties = new Object();
				initialProperties.x = this.x;
				initialProperties.y = this.y;
				initialProperties.width = this.width;
				initialProperties.height = this.height;
			}

			oldCacheAsBitmap = this.cacheAsBitmap;
			this.cacheAsBitmap = false;

			var t:Object = new Object();

			if(isMorphXEnabled && config.x != undefined) t.x = config.x;
			if(isMorphYEnabled && config.y != undefined) t.y = config.y;
			if(isMorphWidthEnabled && config.width != undefined) t.width = config.width;
			if(isMorphHeightEnabled && config.height != undefined) t.height = config.height;

			t.ease = (config.morphEase == undefined) ? morphEase : config.morphEase;
			t.roundProps = ["x", "y", "width", "height"];
			t.onComplete = onMorphComplete;

			new TweenLite(this, (config.morphDuration == undefined) ? morphDuration : config.morphDuration, t);
		}



		/**
		 * Reset to initial position before morph.
		 */
		public function morphReset():void {
			morph(initialProperties);
			initialProperties = null;
		}



		/* ★ SETTERS & GETTERS ★ */


		/**
		 * If {@code width} change flag is set, directly change {@code width}.
		 * @param value New {@code width}
		 */
		override public function set width(value:Number):void {
			if(isChangeWidthEnabled) super.width = value;
		}



		/**
		 * If {@code height} change flag is set, directly change {@code height}.
		 * @param value New {@code height}
		 */
		override public function set height(value:Number):void {
			if(isChangeHeightEnabled) super.height = value;
		}



		/* ★ PRIVATE METHODS ★ */


		/**
		 * Morphing completed.
		 */
		private function onMorphComplete():void {
			cacheAsBitmap = oldCacheAsBitmap;
		}
	}
}
