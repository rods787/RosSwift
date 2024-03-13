//
//  shell.swift
//  msgbuilder
//
//  Created by Thomas Gustafsson on 2019-04-28.
//

import Foundation

public struct Shell {
    let rosmsgPath: URL
    let env: [String: String]

    public init?() {
        env = ProcessInfo.processInfo.environment

        guard env["PYTHONPATH"] != nil else {
            print("PYTHONPATH is not set")
            return nil
        }
        guard let rosPath = env["ROS_PACKAGE_PATH"] else {
            print("ROS_PACKAGE_PATH is not set")
            return nil
        }
        rosmsgPath = Shell.getRosPath(rosPath: rosPath)
    }

    static func getRosPath(rosPath: String) -> URL {
        let parts = rosPath.split(separator: "/").dropLast()
        let rosbin = parts.joined(separator: "/")
        let rosmsgPath = "/" + rosbin + "/bin/rosmsg"
        return URL(fileURLWithPath: rosmsgPath)
    }


    public func rosmsg(_ cmd: [String]) -> String {
        return shell(url: rosmsgPath, args: cmd, environment: env)
    }

    func shell(url: URL, args: [String], environment: [String:String] = [:]) -> String {
#if os(Linux) || os(macOS)
        let task = Process()
        task.executableURL = url
        task.arguments = args
        task.environment = environment
        let pipe = Pipe()
        task.standardOutput = pipe
        do {
            try task.run()
            task.waitUntilExit()
            let data = pipe.fileHandleForReading.readDataToEndOfFile()

            guard let stringRead = String(data: data, encoding: .utf8 ) else {
                return ""
            }
            return stringRead

        } catch let error {
            print(error.localizedDescription)
            return ""
        }
#else
        	return ""
#endif

    }
}
