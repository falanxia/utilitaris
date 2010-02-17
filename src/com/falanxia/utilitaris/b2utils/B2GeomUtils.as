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

	import Box2D.Collision.Shapes.b2CircleDef;
	import Box2D.Collision.Shapes.b2PolygonDef;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2World;

	import com.falanxia.utilitaris.b2utils.objectdata.WorldCoords;
	import com.falanxia.utilitaris.b2utils.objectdata.WorldRectangleObject;
	import com.falanxia.utilitaris.utils.NumberUtils;



	/**
	 * B2GeomUtils class simplifies objects creation in b2World, basicly by converting box2d center-oriented object
	 * creation to (flash) top-left corner oriented.
	 *
	 * CAUTION: use getInstance() to get static acces to nonstatic methods, after that you'll need to call init(),
	 * pass reference to your b2world and set the pixel_to_meter ratio.
	 *
	 * @author Jakub Schimer @ Falanxia a.s.
	 * @since
	 */
	public class B2GeomUtils {

		private static var INSTANCE:B2GeomUtils;

		private var pi:Number;
		private var pi_deg:Number;
		private var pi_rad:Number;

		private var world:b2World;
		private var ratio:Number;



		/**
		 * Singleton (__private) constructor
		 * @param s SingletonEnforcer class, just to make sure it cant be instantiated.
		 */
		public function B2GeomUtils(s:Senf) {

			if(s == null) throw new Error("B2GeomUtils is singleton, use getInstance() method...");

		}



		/**
		 * Used to get static access to nonstatic methods
		 * @return B2GeomUtils singleton instance
		 */
		public static function getInstance():B2GeomUtils {

			if(INSTANCE == null) INSTANCE = new B2GeomUtils(new Senf());

			return INSTANCE;

		}



		/**
		 * Used to init B2GeomUtils
		 * @param world b2World reference we want to work with
		 * @param ratio pixel_to_meter ratio
		 */
		public function init(world:b2World, ratio:Number):void {

			this.world = world;
			this.ratio = ratio;

			pi = Math.PI;
			pi_deg = 180 / pi;
			pi_rad = pi / 180;

		}



		/**
		 * Function creates box in b2world as rectangle (flash) oriented, where x,y defines top-left corner
		 * @rectangle rectangle defines rectangle to create
		 * @param isSensor defines if the body is used as sensor (no collision)
		 * @param density defines density (-> mass) of the body, use 0 for static bodies
		 * @param restitution defines restitution (bounciness) of the body
		 * @param friction defines friction of the body
		 * @return returns reference to the created body in the world
		 */
		public function drawRectangle(rectangle:WorldRectangleObject, isSensor:Boolean = false, density:Number = 0,
		                              restitution:Number = 0.1, friction:Number = 0.1,angularDamping:Number = .5, linearDamping:Number = .5,isBullet:Boolean = false):b2Body {

			var rc:WorldCoords = rectangle.position;

			var def:b2BodyDef = new b2BodyDef();
			def.position.Set((rc.x + rectangle.width / 2) / ratio, (rc.y + rectangle.height / 2) / ratio);
			def.angularDamping = angularDamping;
			def.linearDamping = linearDamping;

			var sh:b2PolygonDef = new b2PolygonDef();
			sh.density = density;
			sh.restitution = restitution;
			sh.friction = friction;
			sh.isSensor = isSensor;
			sh.SetAsOrientedBox((rectangle.width / 2) / ratio, (rectangle.height / 2) / ratio, new b2Vec2(0, 0), rc.rotation * pi_deg / ratio);


			trace(sh.isSensor);

			var b:b2Body = world.CreateBody(def);
			b.SetBullet(isBullet);
			b.CreateShape(sh);
			b.SetMassFromShapes();

			return b;

		}



		/**
		 * Creates circle in the b2world, using flash manner
		 * @param coords defines center of the circle
		 * @param radius defines radius of the circle
		 * @param isSensor defines if the body is used as sensor (no collision)
		 * @param density
		 * @param restitution
		 * @param friction
		 * @return
		 */
		public function drawCircle(coords:WorldCoords, radius:Number, isSensor:Boolean = false, density:Number = 0,
		                           restitution:Number = 0.1, friction:Number = 0.1,angularDamping:Number=.5,linearDamping:Number=.5,isBullet:Boolean = false):b2Body {

			var def:b2BodyDef = new b2BodyDef();
			def.position.Set(coords.x / ratio, coords.y / ratio);
			def.angularDamping = angularDamping;
			def.linearDamping = linearDamping;

			var sh:b2CircleDef = new b2CircleDef();
			sh.density = density;
			sh.restitution = restitution;
			sh.friction = friction;
			sh.isSensor = isSensor;
			sh.radius = radius/ratio;

			var b:b2Body = world.CreateBody(def);
			b.SetBullet(isBullet);
			b.CreateShape(sh);
			b.SetMassFromShapes();

			return b;

		}



		/**
		 * TODO
		 * @param coords
		 * @param vertices
		 * @param isSensor
		 * @param density
		 * @param restitution
		 * @param friction
		 * @return
		 */
		public function drawPolygon(coords:WorldCoords, vertices:Vector.<WorldCoords>, isSensor:Boolean = false, density:Number = 0,
		                            restitution:Number = .1, friction:Number = .1,angularDamping:Number=.5,linearDamping:Number=.5,isBullet:Boolean = false):b2Body {

			var def:b2BodyDef = new b2BodyDef();
			def.position.Set(coords.x / ratio, coords.y / ratio);
			def.angularDamping = angularDamping;
			def.linearDamping = linearDamping;

			var b:b2Body = world.CreateBody(def);

			return b;

		}



		/**
		 * TODO error cases, if wallSize > width || height, etc...
		 * TODO:OPTIMIZE MAYBE, it would be better to create one body with 4 shapes... c'mon dude...
		 * @return
		 */
		public function drawRectangleFence(coords:WorldCoords,width:Number,height:Number,wallSize:Number, isSensor:Boolean = false, density:Number = 0, restitution:Number = .1, friction:Number = .1,angularDamping:Number=.5,linearDamping:Number=.5,isBullet:Boolean=false):Vector.<b2Body> {

			var x:Number = coords.x;
			var y:Number = coords.y;

			var w1:WorldRectangleObject = new WorldRectangleObject("wall1", new WorldCoords(x,y),width,wallSize);
			var w2:WorldRectangleObject = new WorldRectangleObject("wall2", new WorldCoords(x+width-wallSize,y+wallSize),wallSize,height-2*wallSize-y);
			var w3:WorldRectangleObject = new WorldRectangleObject("wall3", new WorldCoords(x,height-wallSize),width,wallSize);
			var w4:WorldRectangleObject = new WorldRectangleObject("wall4", new WorldCoords(x,y+wallSize),wallSize,height-2*wallSize-y);

			/*	var w1:WorldRectangleObject = new WorldRectangleObject("wall1", new WorldCoords(x,y),width,wallSize);
				var w2:WorldRectangleObject = new WorldRectangleObject("wall2", new WorldCoords(x+width,y),-wallSize,height-y);
				var w3:WorldRectangleObject = new WorldRectangleObject("wall3", new WorldCoords(x,height-wallSize),width,wallSize);
				var w4:WorldRectangleObject = new WorldRectangleObject("wall4", new WorldCoords(x+wallSize,y),-wallSize,height-y);
			*/			

			var v:Vector.<b2Body> = new Vector.<b2Body>;
			v.push(drawRectangle(w1,isSensor,density,restitution,friction,angularDamping,linearDamping,isBullet));
			v.push(drawRectangle(w2,isSensor,density,restitution,friction,angularDamping,linearDamping,isBullet));
			v.push(drawRectangle(w3,isSensor,density,restitution,friction,angularDamping,linearDamping,isBullet));
			v.push(drawRectangle(w4,isSensor,density,restitution,friction,angularDamping,linearDamping,isBullet));

			return v;

		}

	}
}

class Senf {
}
