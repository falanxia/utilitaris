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

package com.falanxia.utilitaris.display.atlasanim.director {
	import com.falanxia.utilitaris.display.atlasanim.interfaces.IAtlasDirector;



	/**
	 * Global atlas anim director.
	 *
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 */
	public class GlobalAtlasAnimDirector {



		private static var instance:GlobalAtlasAnimDirector;

		private var director:IAtlasDirector;



		/**
		 * Constructor.
		 */
		public function GlobalAtlasAnimDirector(s:Senf) {
			if(s == null) throw new Error("GlobalAtlasAnimDirector is singleton, use getInstance() method");
		}



		/**
		 * Singleton acces method
		 * @return Instance of the GlobalAtlasAnimDirector singleton.
		 */
		public static function getInstance():GlobalAtlasAnimDirector {
			if(instance == null) instance = new GlobalAtlasAnimDirector(new Senf());

			return instance;
		}



		/**
		 * Destructor.
		 */
		public function destroy():void {
			director.destroy();
			director = null;
		}



		/**
		 * Initialize
		 * @param director Atlas director
		 * @see IAtlasDirector
		 */
		public function init(director:IAtlasDirector):void {
			this.director = director;
		}



		/**
		 * Get the director.
		 * @return Director
		 * @see IAtlasDirector
		 */
		public function getDirector():IAtlasDirector {
			return director;
		}
	}
}



class Senf {
}
