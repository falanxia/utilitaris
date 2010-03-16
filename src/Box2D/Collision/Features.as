package Box2D.Collision {

	import Box2D.Common.b2internal;



	use namespace b2internal;

	/**
	 * We use contact ids to facilitate warm starting.
	 */
	public class Features {
		/**
		 * The edge that defines the outward contact normal.
		 */
		public function get referenceEdge():int {
			return _referenceEdge;
		}



		public function set referenceEdge(value:int):void {
			_referenceEdge = value;
			_m_id._key = (_m_id._key & 0xffffff00) | (_referenceEdge & 0x000000ff);
		}



		b2internal var _referenceEdge:int;



		/**
		 * The edge most anti-parallel to the reference edge.
		 */
		public function get incidentEdge():int {
			return _incidentEdge;
		}



		public function set incidentEdge(value:int):void {
			_incidentEdge = value;
			_m_id._key = (_m_id._key & 0xffff00ff) | ((_incidentEdge << 8) & 0x0000ff00);
		}



		b2internal var _incidentEdge:int;



		/**
		 * The vertex (0 or 1) on the incident edge that was clipped.
		 */
		public function get incidentVertex():int {
			return _incidentVertex;
		}



		public function set incidentVertex(value:int):void {
			_incidentVertex = value;
			_m_id._key = (_m_id._key & 0xff00ffff) | ((_incidentVertex << 16) & 0x00ff0000);
		}



		b2internal var _incidentVertex:int;



		/**
		 * A value of 1 indicates that the reference edge is on shape2.
		 */
		public function get flip():int {
			return _flip;
		}



		public function set flip(value:int):void {
			_flip = value;
			_m_id._key = (_m_id._key & 0x00ffffff) | ((_flip << 24) & 0xff000000);
		}



		b2internal var _flip:int;


		b2internal var _m_id:b2ContactID;
	}
	;


}
