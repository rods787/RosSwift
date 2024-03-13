import Foundation

#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
import CommonCrypto
import CryptoKit
#elseif os(Linux)
import OpenSSL
typealias CC_LONG = size_t
#endif

extension Data {
    var md5: String {
        Insecure.MD5
            .hash(data: self)
            .map {String(format: "%02x", $0)}
            .joined()
    }
}

extension Data {
    /// MD5 Hashing algorithm for hashing a Data instance.
    ///
    /// - Returns: The requested hash output or nil if failure.
    public func hashed() -> String {

        #if os(macOS) || os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)

        return md5

        #elseif os(Linux)
        let length = MD5_DIGEST_LENGTH

        var digest = Data(count: Int(length))
        
        digest.withUnsafeMutableBytes { (digestBytes) in
            self.withUnsafeBytes { (messageBytes) in
                let length = CC_LONG(messageBytes.count)
                MD5(messageBytes.baseAddress?.assumingMemoryBound(to: UInt8.self), length, digestBytes.bindMemory(to: UInt8.self).baseAddress!)
            }
        }

        // return the value based on the specified output type.
        return digest.map { String(format: "%02hhx", $0) }.joined()
		#endif
    }
}


public extension String {

    /// MD5 Hashing algorithm for hashing a string instance.
    /// - Returns: The requested hash output or nil if failure.
    func hashed() -> String? {

        // convert string to utf8 encoded data
        return data(using: .utf8)?.hashed()
    }
}
