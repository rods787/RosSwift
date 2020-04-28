// Generated by msgbuilder 2020-04-28 15:10:00 +0000

import StdMsgs

extension geometry_msgs {
	/// An accel with reference coordinate frame and timestamp
	public struct AccelStamped: MessageWithHeader {
		public static let md5sum: String = "d8a98a5d81351b6eb0578c78557e7659"
		public static let datatype = "geometry_msgs/AccelStamped"
		public static let definition = """
			# An accel with reference coordinate frame and timestamp
			Header header
			Accel accel
			"""

		public static let hasHeader = true

	
		public var header: std_msgs.Header
		public var accel: Accel

		public init(header: std_msgs.Header, accel: Accel) {
			self.header = header
			self.accel = accel
		}

		public init() {
			header = std_msgs.Header()
			accel = Accel()
		}
	}
}