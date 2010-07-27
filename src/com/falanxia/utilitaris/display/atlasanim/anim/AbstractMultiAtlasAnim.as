/*
 * Falanxia BzoonkBar.
 * Copyright (c) 2010 Falanxia (http://falanxia.com). All rights reserved.
 */

package com.falanxia.utilitaris.display.atlasanim.anim {

	import com.falanxia.utilitaris.display.atlasanim.director.IAtlasDirector;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;



	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <jakub.schimer@falanxia.com>
	 * @since
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



		/**
		 * Constructor.
		 */
		public function AbstractMultiAtlasAnim(width:Number, height:Number, atlases:Vector.<BitmapData>,
		                                       atlasesLengths:Array, atlasDirector:IAtlasDirector) {
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
			} else {
				n = frameNum;
			}


			var y:Number = int(n * frameWidth / atlas.width);
			var x:Number = n - y * (atlas.width / frameWidth);

			canvasBD.copyPixels(atlas, new Rectangle(x * frameWidth, y * frameHeight, frameWidth, frameHeight),
			                    new Point(0, 0));

			/*
			 canvasBD.setPixels(new Rectangle(0, 0, frameWidth, frameHeight),
			 atlas.getPixels(new Rectangle(x*frameWidth, y*frameHeight, frameWidth, frameHeight)));
			 */
		}

	}
}
