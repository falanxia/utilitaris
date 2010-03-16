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

package com.falanxia.utilitaris.b2utils {
	import Box2D.Collision.Shapes.b2Shape;
	import Box2D.Collision.b2AABB;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2World;



	/**
	 * B2MouseUtils.
	 *
	 * @author Jakub Schimer @ Falanxia a.s. jakub.schimer@falanxia.com
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @since 1.0
	 */
	public class B2MouseUtils {

		private static var INSTANCE:B2MouseUtils;

		private var world:b2World;
		private var ratio:Number;



		/**
		 * Constructor.
		 */
		public function B2MouseUtils(s:Senf) {

			if(s == null) throw new Error("B2MouseUtils is singleton, use getInstance()...");

		}



		public static function getInstance():B2MouseUtils {

			if(INSTANCE == null) INSTANCE = new B2MouseUtils(new Senf());

			return INSTANCE;

		}



		public function init(world:b2World, ratio:Number):void {

			this.world = world;
			this.ratio = ratio;

		}



		/**
		 * Returns the first b2Body found under the mouse cursor.
		 * @param mouseX mouseX coord (in pixels)
		 * @param mouseY mouseY coord (in pixels)
		 * @param maxCount maximum number of objects (bodies) to querry the world (more than 10 shudn't overleap anyway..)
		 * @param includeStatic set to true if we want to include static bodies to query.
		 * @return first b2body found at cursor position
		 */
		public function getBodyAtMouse(mouseX:Number, mouseY:Number, maxCount:int = 10, includeStatic:Boolean = false):b2Body {

			var mouseXWorldPhys:Number = mouseX / ratio;
			var mouseYWorldPhys:Number = mouseY / ratio;
			var mouseCoords:b2Vec2 = new b2Vec2(mouseXWorldPhys, mouseYWorldPhys);

			var aabb:b2AABB = new b2AABB();
			aabb.lowerBound.Set(mouseXWorldPhys - 0.001, mouseYWorldPhys - 0.001);
			aabb.upperBound.Set(mouseXWorldPhys + 0.001, mouseYWorldPhys + 0.001);

			var shapes:Array = [];
			var count:int = world.Query(aabb, shapes, maxCount);
			var body:b2Body;


			for(var i:int = 0; i < count; ++i) {

				if(shapes[i].GetBody().IsStatic() == false || includeStatic) {

					var tShape:b2Shape = shapes[i];
					var inside:Boolean = tShape.TestPoint(tShape.GetBody().GetXForm(), mouseCoords);

					if(inside) {

						body = tShape.GetBody();
						break;

					}

				}

			}

			return body;

		}

		public function destroy():void {
			INSTANCE = null;
			world = null;
		}

	}

}

class Senf {
}
