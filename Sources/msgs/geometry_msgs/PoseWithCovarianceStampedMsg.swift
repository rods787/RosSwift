// Generated by msgbuilder 2020-04-28 15:10:00 +0000

import StdMsgs

extension geometry_msgs {
	/// This expresses an estimated pose with a reference coordinate frame and timestamp
	public struct PoseWithCovarianceStamped: MessageWithHeader {
		public static let md5sum: String = "953b798c0f514ff060a53a3498ce6246"
		public static let datatype = "geometry_msgs/PoseWithCovarianceStamped"
		public static let definition = """
			# This expresses an estimated pose with a reference coordinate frame and timestamp
			Header header
			PoseWithCovariance pose
			"""

		public static let hasHeader = true

	
		public var header: std_msgs.Header
		public var pose: PoseWithCovariance

		public init(header: std_msgs.Header, pose: PoseWithCovariance) {
			self.header = header
			self.pose = pose
		}

		public init() {
			header = std_msgs.Header()
			pose = PoseWithCovariance()
		}
	}
}