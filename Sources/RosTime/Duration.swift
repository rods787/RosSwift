//
//  Duration.swift
//  RosSwift
//
//  Created by Thomas Gustafsson on 2018-03-15.
//

import BinaryCoder
import Foundation


fileprivate func wallSleep(sec: UInt32, nsec: UInt32) -> Bool {
    var req = timespec(tv_sec: Int(sec), tv_nsec: Int(nsec))
    var rem = timespec(tv_sec: 0, tv_nsec: 0)
    while nanosleep(&req, &rem) != 0 && !Time.gStopped.load(ordering: .relaxed) {
        req = rem

    }
    return !Time.gStopped.load(ordering: .relaxed)
}


public struct RosDuration: DurationBase {
    public let nanoseconds: Int64

    public init(nanosec: Int64) {
        nanoseconds = nanosec
    }

    @discardableResult
    public func sleep() -> Bool {
        if !Time.useSimTime.load(ordering: .relaxed) {
            return wallSleep(sec: UInt32(sec), nsec: UInt32(nsec))
        }

        var start = Time.now
        var end = start + self
        if start.isZero {
            end = Time(nanosec: UInt64.max)
        }

        var didSleep = false
        while !Time.gStopped.load(ordering: .relaxed) && Time.now < end {
            _ = wallSleep(sec: 0, nsec: 1_000)
            didSleep = true
            if start.isZero {
                start = Time.now
                end = start + self
            }
            if Time.now < start {
                return false
            }
        }
        return didSleep && !Time.gStopped.load(ordering: .relaxed)
    }

}

public struct WallDuration: DurationBase {
    public var nanoseconds: Int64

    public init(nanosec: Int64) {
        nanoseconds = nanosec
    }

    @discardableResult
    public func sleep() -> Bool {
        return wallSleep(sec: UInt32(sec), nsec: UInt32(nsec))
    }

    public static func + (lhs: WallDuration, rhs: WallDuration) -> WallDuration {
        return WallDuration(nanosec: lhs.nanoseconds + rhs.nanoseconds)
    }
}
