/*
 * Falanxia Utilitaris.
 *
 * Copyright (c) 2011 Falanxia (http://falanxia.com)
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

package com.falanxia.utilitaris.display.atlasanim.anim {
	import com.falanxia.utilitaris.display.atlasanim.interfaces.IAtlasAnim;
	import com.falanxia.utilitaris.display.atlasanim.interfaces.IAtlasDirector;

	import flash.display.BitmapData;



	/**
	 * Random atlas animation.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. <kuba@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 */
	public class RandomAtlasAnim extends AbstractMultiAtlasAnim implements IAtlasAnim {



		/**
		 * Constructor.
		 * @param width Animation width
		 * @param height Animation height
		 * @param atlases Atlas list
		 * @param atlasesLengths Atlas frame count
		 * @param atlasDirector IAtlasDirector reference
		 * @see IAtlasDirector
		 */
		public function RandomAtlasAnim(width:Number, height:Number, atlases:Vector.<BitmapData>, atlasesLengths:Array,
		                                atlasDirector:IAtlasDirector) {
			super(width, height, atlases, atlasesLengths, atlasDirector);
		}



		/**
		 * Update the animation.
		 */
		public function update():void {
			this.drawFrame(Math.round(Math.random() * maxFrame));
		}
	}
}
