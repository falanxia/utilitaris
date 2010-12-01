/*
 * Copyright (c) 2010 Vaclav Vancura (http://vaclav.vancura.org)
 */

package com.falanxia.utilitaris.display.atlasanim.anim {
	import com.falanxia.utilitaris.display.atlasanim.interfaces.IAtlasAnim;
	import com.falanxia.utilitaris.display.atlasanim.interfaces.IAtlasDirector;

	import flash.display.BitmapData;



	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <kuba@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since
	 */
	public class RandomAtlasAnim extends AbstractMultiAtlasAnim implements IAtlasAnim {



		/**
		 * Constructor.
		 */
		public function RandomAtlasAnim(width:Number, height:Number, atlases:Vector.<BitmapData>, atlasesLengths:Array,
		                                       atlasDirector:IAtlasDirector) {
			super(width, height, atlases, atlasesLengths, atlasDirector);
		}



		public function update():void {
			this.drawFrame(Math.round(Math.random() * maxFrame));
		}
	}
}