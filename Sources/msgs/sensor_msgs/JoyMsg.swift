// Generated by msgbuilder 2020-04-28 15:10:00 +0000

import StdMsgs

extension sensor_msgs {
	/// Reports the state of a joysticks axes and buttons.
	public struct Joy: MessageWithHeader {
		public static let md5sum: String = "5a9ea5f83505693b71e785041e67a8bb"
		public static let datatype = "sensor_msgs/Joy"
		public static let definition = """
			# Reports the state of a joysticks axes and buttons.
			Header header           # timestamp in the header is the time the data is received from the joystick
			float32[] axes          # the axes measurements from a joystick
			int32[] buttons         # the buttons measurements from a joystick 
			"""

		public static let hasHeader = true

	
		public var header: std_msgs.Header
		public var axes: [Float32]
		public var buttons: [Int32]

		public init(header: std_msgs.Header, axes: [Float32], buttons: [Int32]) {
			self.header = header
			self.axes = axes
			self.buttons = buttons
		}

		public init() {
			header = std_msgs.Header()
			axes = [Float32]()
			buttons = [Int32]()
		}
	}
}