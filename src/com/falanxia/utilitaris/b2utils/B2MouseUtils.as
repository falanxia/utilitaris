/*
 * Copyright (c) 2010 Vaclav Vancura (http://vaclav.vancura.org)
 */

package com.falanxia.utilitaris.b2utils {
	import Box2D.Collision.Shapes.b2Shape;
	import Box2D.Collision.b2AABB;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2World;



	/**
	 *
	 *
	 * @author Jakub Schimer @ Falanxia a.s. jakub.schimer@falanxia.com
	 * @since
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
		 * TODO: This actually works only if there is no container offset, we need to finish this to add more
		 * flexibility... shouldn't be a problem, ia'm just not in a mood at the moment, need to finish poolGame...
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
			world = null;
		}

	}

}

class Senf {
}
