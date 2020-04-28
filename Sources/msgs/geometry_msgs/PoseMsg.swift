// Generated by msgbuilder 2020-04-28 15:10:00 +0000

import StdMsgs

extension geometry_msgs {
	/// A representation of pose in free space, composed of position and orientation. 
	public struct Pose: Message {
		public static let md5sum: String = "e45d45a5a1ce597b249e23fb30fc871f"
		public static let datatype = "geometry_msgs/Pose"
		public static let definition = """
			# A representation of pose in free space, composed of position and orientation. 
			Point position
			Quaternion orientation
			"""

		public static let hasHeader = false

	
		public var position: Point
		public var orientation: Quaternion

		public init(position: Point, orientation: Quaternion) {
			self.position = position
			self.orientation = orientation
		}

		public init() {
			position = Point()
			orientation = Quaternion()
		}
	}
}