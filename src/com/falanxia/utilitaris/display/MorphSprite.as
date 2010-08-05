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
	import com.greensock.*;
	import com.greensock.easing.*;

	import flash.display.*;



	/**
	 * Morphable Sprite.
	 * You can animate position and size of any extending Class.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @since 1.0
	 */
	public class MorphSprite extends QSprite {



		/** Default morphing duration in seconds */
		public static var defaultMorphDuration:Number = 0.75;

		/** Default morphing easing Function */
		public static var defaultMorphEase:Function = Elastic.easeOut;

		/** Default width change flag */
		public static var deaultIsChangeWidthEnabled:Boolean = true;

		/** Default height change flag */
		public static var defaultIsChangeHeightEnabled:Boolean = true;

		/** Default x morphing flag */
		public static var defaultIsMorphXEnabled:Boolean = true;

		/** Default y morphing flag */
		public static var defaultIsMorphYEnabled:Boolean = true;

		/** Default width morphing flag */
		public static var defaultIsMorphWidthEnabled:Boolean = true;

		/** Default height morphing flag */
		public static var defaultIsMorphHeightEnabled:Boolean = true;

		/** Current morphing duration in seconds */
		public var morphDuration:Number;

		/** Current morphing easing Function */
		public var morphEase:Function;

		/** Current width change flag */
		public var isChangeWidthEnabled:Boolean;

		/** Current height change flag */
		public var isChangeHeightEnabled:Boolean;

		/** Current x morphing flag */
		public var isMorphXEnabled:Boolean;

		/** Current y morphing flag */
		public var isMorphYEnabled:Boolean;

		/** Current width morphing flag */
		public var isMorphWidthEnabled:Boolean;

		/** Current height morphing flag */
		public var isMorphHeightEnabled:Boolean;


		private var oldCacheAsBitmap:Boolean;
		private var initialProperties:Object;



		/**
		 * Constructor.
		 * @usageNote Possible config contents:
		 *      <ul>
		 *          <li>morphDuration - Morphing duration in seconds. If not defined, defaultMorphDuration used instead.</li>
		 *          <li>morphEase - Morphing transition Function. If not defined, defaultMorphEase used instead.</li>
		 *          <li>isChangeWidthEnabled - width change flag. If not defined, defaultIsChangeWidthEnabled used instead.</li>
		 *          <li>isChangeHeightEnabled - height change flag. If not defined, defaultIsChangeHeightEnabled used instead.</li>
		 *          <li>isMorphXEnabled - x morphing flag. If not defined, defaultIsMorphXEnabled used instead.</li>
		 *          <li>isMorphYEnabled - y morphing flag. If not defined, defaultIsMorphYEnabled used instead.</li>
		 *          <li>isMorphWidthEnabled - width morphing flag. If not defined, defaultIsMorphWidthEnabled used instead.</li>
		 *          <li>isMorphHeightEnabled - height morphing flag. If not defined, defaultIsMorphHeightEnabled used instead.</li>
		 *      </ul>
		 * @param config Config Object
		 * @param parent Parent DisplayObjectContainer
		 */
		public function MorphSprite(config:Object = null, parent:DisplayObjectContainer = null) {
			var c:Object;

			// create config value object
			if(config == null) {
				c = new Object();
			}
			else {
				c = config;
			}

			// create parent QSprite
			super(c, parent);

			// assign values
			morphDuration = (c.morphDuration == undefined) ? defaultMorphDuration : c.morphDuration;
			morphEase = (c.morphEase == undefined) ? defaultMorphEase : c.morphEase;
			isChangeWidthEnabled = (c.isChangeWidthEnabled == undefined) ? deaultIsChangeWidthEnabled : c.isChangeWidthEnabled;
			isChangeHeightEnabled = (c.isChangeHeightEnabled == undefined) ? defaultIsChangeHeightEnabled : c.isChangeHeightEnabled;
			isMorphXEnabled = (c.isMorphXEnabled == undefined) ? defaultIsMorphXEnabled : c.isMorphXEnabled;
			isMorphYEnabled = (c.isMorphYEnabled == undefined) ? defaultIsMorphYEnabled : c.isMorphYEnabled;
			isMorphWidthEnabled = (c.isMorphWidthEnabled == undefined) ? defaultIsMorphWidthEnabled : c.isMorphWidthEnabled;
			isMorphHeightEnabled = (c.isMorphHeightEnabled == undefined) ? defaultIsMorphHeightEnabled : c.isMorphHeightEnabled;
		}



		/**
		 * Destroys the MorphSprite instance and frees it for GC.
		 */
		public override function destroy():void {
			super.destroy();

			morphEase = null;
			initialProperties = null;
		}



		/**
		 * Animate state change.
		 * Timing is taken from morphDuration, transition from morphEase.
		 * Follows status flags (MorphSprite#isMorphXEnabled, MorphSprite#isMorphYEnabled, MorphSprite#isMorphWidthEnabled and MorphSprite#isMorphHeightEnabled).
		 * @usageNote Possible config contents:
		 *      <ul>
		 *          <li>x - New x position</li>
		 *          <li>y - New y position</li>
		 *          <li>width - New width</li>
		 *          <li>height - New height</li>
		 *          <li>morphEase - easing Function</li>
		 *          <li>morphDuration - duration in seconds</li>
		 *      </ul>
		 * @param config Config Object
		 */
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
			t.roundProps = [
				"x", "y", "width", "height"
			];
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



		/**
		 * If width change flag is set, directly change width.
		 * @param value New width
		 */
		override public function set width(value:Number):void {
			if(isChangeWidthEnabled) super.width = value;
		}



		/**
		 * If height change flag is set, directly change height.
		 * @param value New height
		 */
		override public function set height(value:Number):void {
			if(isChangeHeightEnabled) super.height = value;
		}



		private function onMorphComplete():void {
			cacheAsBitmap = oldCacheAsBitmap;
		}
	}
}
