//
//  IntraProcessSubscriberLink.swift
//  RosSwift
//
//  Created by Thomas Gustafsson on 2018-10-23.
//

import Atomics
import StdMsgs

struct IntraProcessSubscriberLink: SubscriberLink {
    weak var parent: Publication!
    let connectionId: UInt
    let destinationCallerId: String
    let topic: String
    let transportInfo = "INTRAPROCESS"

    weak var subscriber: IntraProcessPublisherLink?
    let isDropped = ManagedAtomic(false)
    var isLatching: Bool { parent?.isLatching() ?? false }



    init(ros: Ros, parent: Publication, subscriber: IntraProcessPublisherLink) {
        self.parent = parent
        topic = parent.name
        self.subscriber = subscriber
        connectionId = UInt(ros.connectionManager.getNewConnectionID())
        destinationCallerId = ros.name
    }

    func enqueueMessage(m: SerializedMessage) {
        if isDropped.load(ordering: .relaxed) {
            return
        }

        // We have to remove the four first bytes with length information

        m.buf = [UInt8](m.buf.dropFirst(4))

        subscriber?.handleMessage(m: m)
    }

    func dropParentPublication() {
        if isDropped.compareExchange(expected: false, desired: true, ordering: .relaxed).exchanged {
            subscriber?.dropPublisherLink()
            // subscriber = nil

            ROS_DEBUG("Connection to local subscriber on topic [\(topic)] dropped")
            parent.removeSubscriberLink(self)
        }
    }



}
