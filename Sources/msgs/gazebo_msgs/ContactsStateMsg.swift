// Generated by msgbuilder 2020-04-29 07:43:35 +0000

import StdMsgs

extension gazebo_msgs {

	public struct ContactsState: MessageWithHeader {
		public static let md5sum: String = "acbcb1601a8e525bf72509f18e6f668d"
		public static let datatype = "gazebo_msgs/ContactsState"
		public static let definition = """
			Header header                                   # stamp
			gazebo_msgs/ContactState[] states            # array of geom pairs in contact
			"""

		public static let hasHeader = true

	
		public var header: std_msgs.Header
		public var states: [ContactState]

		public init(header: std_msgs.Header, states: [ContactState]) {
			self.header = header
			self.states = states
		}

		public init() {
			header = std_msgs.Header()
			states = [ContactState]()
		}
	}
}