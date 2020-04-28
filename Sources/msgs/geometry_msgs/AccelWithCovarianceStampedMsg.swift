// Generated by msgbuilder 2020-04-28 15:10:00 +0000

import StdMsgs

extension geometry_msgs {
	/// This represents an estimated accel with reference coordinate frame and timestamp.
	public struct AccelWithCovarianceStamped: MessageWithHeader {
		public static let md5sum: String = "96adb295225031ec8d57fb4251b0a886"
		public static let datatype = "geometry_msgs/AccelWithCovarianceStamped"
		public static let definition = """
			# This represents an estimated accel with reference coordinate frame and timestamp.
			Header header
			AccelWithCovariance accel
			"""

		public static let hasHeader = true

	
		public var header: std_msgs.Header
		public var accel: AccelWithCovariance

		public init(header: std_msgs.Header, accel: AccelWithCovariance) {
			self.header = header
			self.accel = accel
		}

		public init() {
			header = std_msgs.Header()
			accel = AccelWithCovariance()
		}
	}
}