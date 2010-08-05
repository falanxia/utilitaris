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

package com.falanxia.utilitaris.utils {
	import com.falanxia.utilitaris.types.*;

	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;



	/**
	 * Align utilities.
	 *
	 * @author Falanxia (<a href="http://falanxia.com">falanxia.com</a>, <a href="http://twitter.com/falanxia">@falanxia</a>)
	 * @author Vaclav Vancura @ Falanxia a.s. <vaclav@falanxia.com>
	 * @author Jackson Dunstan (<a href="http://jacksondunstan.com/articles/519">http://jacksondunstan.com/articles/519</a>)
	 * @author VitaLee (<a href="http://meet.berovbros.com">meet.berovbros.com</a>)
	 * @author Karl Knocking
	 * @author Matt W (<a href="http://blog.nobien.net">blog.nobien.net</a>)
	 * @author Jonnie Hallman / Destroytoday (<a href="http://destroytoday.com">destroytoday.com</a>)
	 * @since 1.0
	 * @see RGBA
	 */
	public final class DisplayUtils {



		/** Default thickness */
		public static const DEFAULT_THICKNESS:Number = 0;

		/** Default radius */
		public static const DEFAULT_RADIUS:Number = 20;

		/** Default segments */
		public static const DEFAULT_SEGMENTS:Number = 6;

		/** Default padding */
		public static const DEFAULT_PADDING:Number = 8;

		/** Square 100x100 */
		public static const SQUARE_100:Rectangle = new Rectangle(0, 0, 100, 100);

		/** Maximum rectangle covering whole Flash Player screen space (so far) */
		public static const MAX_RECT:Rectangle = new Rectangle(0, 0, 2880, 2880);

		/** Red color */
		public static const RED:RGBA = new RGBA(255, 0, 0, 255);

		/** Green color */
		public static const GREEN:RGBA = new RGBA(0, 255, 0, 255);

		/** Blue color */
		public static const BLUE:RGBA = new RGBA(0, 0, 255, 255);

		/** White color */
		public static const WHITE:RGBA = new RGBA(255, 255, 255, 255);

		/** Black color */
		public static const BLACK:RGBA = new RGBA(0, 0, 0, 255);

		/** Transparent color */
		public static const TRANSPARENT:RGBA = new RGBA(0, 0, 0, 0);

		/** Zero point */
		public static const ZERO:Point = new Point(0, 0);



		/**
		 * Constructor.
		 * Cannot be instantiated, throws an Error.
		 * @throws Error since the class could not be instantiated
		 */
		public function DisplayUtils() {
			throw new Error("The class cannot be instantiated");
		}



		/**
		 * Clear graphics.
		 * Shortcut to canvas.graphics.clear().
		 * @param canvas Canvas to be cleared
		 */
		public static function clear(canvas:Sprite):void {
			canvas.graphics.clear();
		}



		/**
		 * Shortcut to draw a rectangle.
		 * @param canvas Sprite to draw on
		 * @param rect Rectangle
		 * @param rgba RGBA color
		 */
		public static function drawRect(canvas:Sprite, rect:Rectangle, rgba:RGBA):void {
			var g:Graphics = canvas.graphics;

			g.beginFill(rgba.color24, rgba.af);
			g.drawRect(rect.x, rect.y, rect.width, rect.height);
			g.endFill();
		}



		/**
		 * Shortcut to draw a circle.
		 * @param canvas Sprite to draw on
		 * @param center Center position
		 * @param radius Radius
		 * @param rgba RGBA color
		 */
		public static function drawCircle(canvas:Sprite, center:Point, rgba:RGBA, radius:Number = DEFAULT_RADIUS):void {
			var g:Graphics = canvas.graphics;

			g.beginFill(rgba.color24, rgba.af);
			g.drawCircle(center.x, center.y, radius);
			g.endFill();
		}



		/**
		 * Shortcut to draw a rounded rectangle.
		 * @param canvas Sprite to draw on
		 * @param rect Rectangle
		 * @param radius Radius
		 * @param rgba RGBA color
		 */
		public static function drawRoundRect(canvas:Sprite, rect:Rectangle, rgba:RGBA, radius:Number = DEFAULT_RADIUS):void {
			var g:Graphics = canvas.graphics;

			g.beginFill(rgba.color24, rgba.af);
			g.drawRoundRect(rect.x, rect.y, rect.width, rect.height, radius, radius);
			g.endFill();
		}



		/**
		 * Shortcut to draw a pie.
		 * @param canvas Sprite to draw on
		 * @param center Center position
		 * @param radius Radius
		 * @param segments Segments
		 * @param angle1 Angle 1
		 * @param angle2 Angle 2
		 * @param rgba RGBA color
		 */
		public static function drawPie(canvas:Sprite, center:Point, rgba:RGBA, radius:Number = DEFAULT_RADIUS, segments:int = DEFAULT_SEGMENTS, angle1:Number = 0,
		                               angle2:Number = 360):void {
			var segm:Number;
			var grad:Number;
			var x1:Number;
			var y1:Number;
			var rad:Number = Math.PI / 180;
			var a:Number = angle1;
			var g:Graphics = canvas.graphics;

			g.beginFill(rgba.color24, rgba.af);

			if(!a && !angle2 || a == angle2) {
				// full circle
				grad = 360;

				segm = grad / segments;
				x1 = radius + center.x;
				y1 = center.y;

				g.moveTo(x1, y1);
			}
			else {
				// not a full circle
				if(a > angle2) {
					a -= 360;
				}

				x1 = radius * Math.cos(a * rad) + center.x;
				y1 = radius * Math.sin(a * rad) + center.y;
				grad = angle2 - a;
				segm = grad / segments;

				g.moveTo(center.x, center.y);
				g.lineTo(x1, y1);
			}

			for(var s:Number = segm + a; s < grad + 0.1 + a; s += segm) {
				var x2:Number = radius * Math.cos((s - segm / 2) * rad) + center.x;
				var y2:Number = radius * Math.sin((s - segm / 2) * rad) + center.y;
				var x3:Number = radius * Math.cos(s * rad) + center.x;
				var y3:Number = radius * Math.sin(s * rad) + center.y;
				var cx:Number = 2 * x2 - 0.5 * (x1 + x3);
				var cy:Number = 2 * y2 - 0.5 * (y1 + y3);

				x1 = x3;
				y1 = y3;

				g.curveTo(cx, cy, x3, y3);
			}

			if(grad != 360) g.lineTo(center.x, center.y);

			g.endFill();
		}



		/**
		 * Shortcut to stroke a rectangle.
		 * @param canvas Sprite to draw on
		 * @param rect Rectangle
		 * @param rgba RGBA color
		 * @param thickness Thickness
		 */
		public static function strokeRect(canvas:Sprite, rect:Rectangle, rgba:RGBA, thickness:Number = DEFAULT_THICKNESS):void {
			var g:Graphics = canvas.graphics;

			g.lineStyle(thickness, rgba.color24, rgba.af, true);
			g.drawRect(rect.x, rect.y, rect.width - 1, rect.height - 1);
		}



		/**
		 * Shortcut to draw a line.
		 * @param canvas Sprite to draw on
		 * @param start Start Point
		 * @param end End Point
		 * @param rgba RGBA color
		 * @param thickness Thickness
		 */
		public static function strokeLine(canvas:Sprite, start:Point, end:Point, rgba:RGBA, thickness:Number = DEFAULT_THICKNESS):void {
			var g:Graphics = canvas.graphics;

			g.lineStyle(thickness, rgba.color24, rgba.af, true);
			g.moveTo(start.x, start.y);
			g.lineTo(end.x, end.y);
		}



		/**
		 * Draw bounding corners.
		 * @param canvas Sprite to draw on
		 * @param rect Rectangle
		 * @param rgba RGBA color
		 * @param padding Padding
		 */
		public static function strokeBounds(canvas:Sprite, rect:Rectangle, rgba:RGBA, padding:Number = DEFAULT_PADDING):void {
			var w:Number = rect.width - 1;
			var h:Number = rect.height - 1;
			var g:Graphics = canvas.graphics;

			g.lineStyle(0, rgba.color24, rgba.af, true);
			g.moveTo(rect.x, padding + rect.y);
			g.lineTo(rect.x, rect.y);
			g.lineTo(padding + rect.x, rect.y);
			g.moveTo(w - padding + rect.x, rect.y);
			g.lineTo(w + rect.x, rect.y);
			g.lineTo(w + rect.x, padding + rect.y);
			g.moveTo(w + rect.x, h - padding + rect.y);
			g.lineTo(w + rect.x, h + rect.y);
			g.lineTo(w - padding + rect.x, h + rect.y);
			g.moveTo(padding + rect.x, h + rect.y);
			g.lineTo(rect.x, h + rect.y);
			g.lineTo(rect.x, h - padding + rect.y);
		}



		/**
		 * Apply a scrollRect from (0, 0) to (width, height).
		 * @param dispObj DisplayObject to apply on
		 */
		public static function applyNaturalScrollRect(dispObj:DisplayObject):void {
			dispObj.scrollRect = new Rectangle(0, 0, dispObj.width, dispObj.height);
		}



		/**
		 * Wait a given number of frames then call a callback.
		 * @param numFrames Number of frames to wait before calling the callback
		 * @param callback Function to call once the given Number of frames have passed
		 */
		public static function wait(numFrames:uint, callback:Function):void {
			var nf:uint = numFrames;
			var obj:Shape = new Shape();

			// TODO: Optimize me
			obj.addEventListener(Event.ENTER_FRAME, function(ev:Event):void {
				nf--;
				if(nf == 0) {
					obj.removeEventListener(Event.ENTER_FRAME, arguments.callee);
					callback();
				}
			});
		}



		/**
		 * Basically an addChild() for more children at once.
		 * Just saves few lines of code, nothing special.
		 * @param container Target DisplayObjectContainer
		 * @param children Children to be added
		 */
		public static function addChildren(container:DisplayObjectContainer, ... children:Array):void {
			for each(var i:DisplayObject in children) container.addChild(i);
		}



		/**
		 * Basically an addChild() for more children at once.
		 * Just saves few lines of code, nothing special.
		 * @param container Target DisplayObjectContainer
		 * @param children Children to be removed
		 */
		public static function removeChildren(container:DisplayObjectContainer, ... children:Array):void {
			for each(var i:DisplayObject in children) {
				if(container.contains(i)) container.removeChild(i);
			}
		}



		/**
		 * Remove all children from a container and leave the bottom few.
		 * @param container DisplayObjectContainer to remove from
		 * @param leave (optional) Number of bottom children to leave
		 */
		public static function removeAllChildren(container:DisplayObjectContainer, leave:int = 0):void {
			while(container.numChildren > leave) container.removeChildAt(leave);
		}



		/**
		 * Duplicate a MovieClip.
		 * @param source Source MovieClip
		 * @return Duplicated MovieClip
		 */
		public static function duplicateMovieClip(source:MovieClip):MovieClip {
			var targetClass:Class = Class(Object(source).constructor);

			return(MovieClip(new targetClass()));
		}



		/**
		 * Instantiate a new instance of a certain class of DisplayObject.
		 * @param obj DisplayObject whose Class a new DisplayObject should be instantiated of
		 * @param args Arguments to pass to the DisplayObject's constructor
		 * @return New instance of the given DisplayObject's Class
		 */
		public static function instantiate(obj:Object, args:Array):DisplayObject {
			var c:Class = ClassUtils.getDisplayObjectClass(obj);

			return c == null ? null : DisplayObject(instantiate(c, args));
		}



		/**
		 * Check if a DisplayObject is visible. This checks all of its parents' visibilities.
		 * @param obj DisplayObject to check
		 */
		public static function isVisible(obj:DisplayObject):Boolean {
			var out:Boolean = true;

			for(var cur:DisplayObject = obj; cur != null; cur = cur.parent) {
				if(!cur.visible) out = false;
			}

			return out;
		}



		/**
		 * Get the children of a container as an Array.
		 * @param container DisplayObjectContainer to get the children of
		 * @return Children of the given container as an Array
		 */
		public static function getChildren(container:DisplayObjectContainer):Array {
			var out:Array = [
			];
			var numChildren:int = container.numChildren;

			for(var i:int = 0; i < numChildren; ++i) {
				out.push(container.getChildAt(i));
			}

			return out;
		}



		/**
		 * Get the parents of a DisplayObject as an Array.
		 * @param obj DisplayObject whose parents should be retrieved
		 * @param includeSelf If obj should be included in the returned Array
		 * @param stopAt DisplayObject to stop getting parents at, passing null indicates that all parents should be included
		 * @return Array of the parents of the given DisplayObject - this includes all parents unless stopAt is non-null. If stopAt is non-null, it and its parents will not be included in the returned Array
		 */
		public static function getParents(obj:DisplayObject, includeSelf:Boolean = true, stopAt:DisplayObject = null):Array {
			var out:Array = [
			];

			for(var cur:DisplayObject = includeSelf ? obj : obj.parent; cur != stopAt && cur != null; cur = cur.parent) {
				out.push(cur);
			}

			return out;
		}



		/**
		 * Filter children by their properties.
		 * @param container DisplayObjectContainer
		 * @param props Properties
		 * @return Array of filtered children
		 */
		public static function filterChildrenByProps(container:DisplayObjectContainer, props:Object):Array {
			var out:Array = [
			];
			var child:DisplayObject;

			for(var i:int = 0, l:int = container.numChildren; i < l; i++) {
				child = container.getChildAt(i);
				var isOK:Boolean = true;
				for(var prop:String in props) {
					if(child[prop] != props[prop]) {
						isOK = false;
						break;
					}
				}
				if(isOK) out.push(child);
			}

			return out;
		}



		/**
		 * Set properties of children.
		 * @param children Children to set properties on
		 * @param props Properties
		 */
		public static function setProperties(children:Array, props:Object):void {
			var child:DisplayObject;

			for(var i:int = 0, l:uint = children.length; i < l; i++) {
				child = children[i];

				for(var prop:String in props) {
					child[prop] = props[prop];
				}
			}
		}



		/**
		 * Count Number of children with certain property.
		 * @param children Children to check
		 * @param prop Property
		 * @return Number of filtered children
		 */
		public static function sumProps(children:Array, prop:String):Number {
			var out:Number = 0;

			for(var i:int = 0, l:uint = children.length; i < l; i++) {
				out += children[i][prop];
			}

			return out;
		}



		/**
		 * Get DisplayObject original width.
		 * @param obj DisplayObject
		 * @return Original width
		 */
		public static function originalWidth(obj:DisplayObject):Number {
			return obj.width / obj.scaleX;
		}



		/**
		 * Get DisplayObject original height.
		 * @param obj DisplayObject
		 * @return Original height
		 */
		public static function originalHeight(obj:DisplayObject):Number {
			return obj.height / obj.scaleY;
		}



		/**
		 * Get distance between two DisplayObjects
		 * @param dO1 DisplayObject 1
		 * @param dO2 DisplayObject 2
		 * @return Distance
		 */
		public static function relativePos(dO1:DisplayObject, dO2:DisplayObject):Point {
			var out:Point = new Point(0, 0);

			out = dO1.localToGlobal(out);
			out = dO2.globalToLocal(out);

			return out;
		}



		/**
		 * Determines the full bounds of the DisplayObject regardless of masking elements.
		 * @param displayObject DisplayObject to analyze
		 * @return DisplayObject dimensions
		 */
		public static function getFullBounds(displayObject:DisplayObject):Rectangle {
			var bounds:Rectangle, transform:Transform, toGlobalMatrix:Matrix, currentMatrix:Matrix;

			transform = displayObject.transform;
			currentMatrix = transform.matrix;
			toGlobalMatrix = transform.concatenatedMatrix;
			toGlobalMatrix.invert();
			transform.matrix = toGlobalMatrix;

			bounds = transform.pixelBounds.clone();

			transform.matrix = currentMatrix;

			return bounds;
		}



		/**
		 * Stops all timelines of the specified DisplayObject and its children.
		 * @param displayObject DisplayObject to loop through
		 */
		public static function stopAllTimelines(displayObject:DisplayObjectContainer):void {
			var numChildren:int = displayObject.numChildren;

			for(var i:int = 0; i < numChildren; i++) {
				var child:DisplayObject = displayObject.getChildAt(i);

				if(child is DisplayObjectContainer) {
					if(child is MovieClip) MovieClip(child).stop();

					stopAllTimelines(DisplayObjectContainer(child));
				}
			}
		}



		/**
		 * Brings the DisplayObject to the front of the display list. The back parameter can be used to
		 * pull the DisplayObject back a few levels from the front.
		 * @param object DisplayObject to reorder
		 * @param back Number of levels from the front of the display list
		 * @return New index of the DisplayObject
		 */
		public static function bringToFront(object:DisplayObject, back:uint = 0):int {
			var out:int;

			if(object.parent) {
				out = object.parent.numChildren - (back + 1);
				out = NumberUtils.confine(out, 0, object.parent.numChildren - 1);

				object.parent.setChildIndex(object, out);
			}
			else {
				out = -1;
			}

			return out;
		}



		/**
		 * Brings the DisplayObject forward in the display list. The steps parameter can be used to jump
		 * more than one level.
		 * @param object DisplayObject to reorder
		 * @param steps Number of levels bring the DisplayObject forward
		 * @return New index of the DisplayObject
		 */
		public static function bringForward(object:DisplayObject, steps:uint = 1):int {
			var out:int;

			if(object.parent) {
				out = object.parent.getChildIndex(object) + steps;
				out = NumberUtils.confine(out, 0, object.parent.numChildren - 1);

				object.parent.setChildIndex(object, out);
			}
			else {
				out = -1;
			}

			return out;
		}



		/**
		 * Sends the DisplayObject to the back of the display list. The forward parameter can be used to
		 * bring the DisplayObject forward a few levels from the back.
		 * @param object DisplayObject to reorder
		 * @param forward Number of levels from the back of the display list
		 * @return New index of the DisplayObject
		 */
		public static function sendToBack(object:DisplayObject, forward:uint = 0):int {
			var out:int;

			if(object.parent) {
				out = NumberUtils.confine(forward, 0, object.parent.numChildren - 1);

				object.parent.setChildIndex(object, out);
			}
			else {
				out = -1;
			}

			return out;
		}



		/**
		 * Sends the DisplayObject back in the display list. The steps parameter can be used to jump
		 * more than one level.
		 * @param object DisplayObject to reorder
		 * @param steps Number of levels send the DisplayObject backward
		 * @return New index of the DisplayObject
		 */
		public static function sendBackward(object:DisplayObject, steps:uint = 1):int {
			var out:int;

			if(object.parent) {
				out = object.parent.getChildIndex(object) - steps;
				out = NumberUtils.confine(out, 0, object.parent.numChildren - 1);

				object.parent.setChildIndex(object, out);
			}
			else {
				out = -1;
			}

			return out;
		}



		/**
		 * trace() children of the DisplayObjectContainer.
		 * @param container DisplayObjectContainer to get children of
		 * @param indentLevel Indetnation level (default 0)
		 */
		public static function traceChildren(container:DisplayObjectContainer, indentLevel:int = 0):void {
			for(var i:int = 0; i < container.numChildren; i++) {
				var thisChild:DisplayObject = container.getChildAt(i);
				var output:String = "";

				for(var j:int = 0; j < indentLevel; j++) output += "   ";

				output += "+  " + thisChild.name + " = " + thisChild.toString();

				trace(output);

				if(thisChild is DisplayObjectContainer) traceChildren(DisplayObjectContainer(thisChild), indentLevel + 1);
			}
		}
	}
}
