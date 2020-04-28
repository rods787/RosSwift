// Generated by msgbuilder 2020-04-28 15:10:00 +0000

import StdMsgs

extension geometry_msgs {
	/// This expresses velocity in free space broken into its linear and angular parts.
	public struct Twist: Message {
		public static let md5sum: String = "9f195f881246fdfa2798d1d3eebca84a"
		public static let datatype = "geometry_msgs/Twist"
		public static let definition = """
			# This expresses velocity in free space broken into its linear and angular parts.
			Vector3  linear
			Vector3  angular
			"""

		public static let hasHeader = false

	
		public var linear: Vector3
		public var angular: Vector3

		public init(linear: Vector3, angular: Vector3) {
			self.linear = linear
			self.angular = angular
		}

		public init() {
			linear = Vector3()
			angular = Vector3()
		}
	}
}