//
//  ParametersService.swift
//  LabirintMini
//
//  Created by homatov on 28.03.2022.
//

import NodeKit

import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

protocol ParametersServiceProtocol {
    func makeParams(add parameters: [String : String]) -> [String : String]
    func getParamString(parameters: [String : String]) -> String
    func hashToMD5(from string: String) -> String
}

final class ParametersService: ParametersServiceProtocol {
    
    private let privateKey = "ee60a7d05bde179ac717697efdcc8f09"
    
    private var constantParam: [String : String] = ["build": Bundle.main.buildVersionNumber,
                                            "bundleId": "91528577",
                                            "debug": "true",
                                            "imageSize": "2",
                                            "version": Bundle.main.releaseVersionNumber]
    
    func makeParams(add parameters: [String : String]) -> [String : String] {
        let newParams = constantParam.merging(parameters) { (current, _) in current }
        let paramString = getParamString(parameters: newParams)
        let signature = hashToMD5(from: paramString)
        return newParams.merging(["sig": signature]) { (current, _) in current }
    }
    
    func getParamString(parameters: [String : String]) -> String {
        let sortingDict = parameters.sorted { $0.key < $1.key }
        return sortingDict.map { $0.key + $0.value }.joined(separator: "") + privateKey
    }
    
    func hashToMD5(from string: String) -> String {
            let length = Int(CC_MD5_DIGEST_LENGTH)
            guard let messageData = string.data(using: .utf8) else {
                return ""
            }
            var digestData = Data(count: length)

            _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
                messageData.withUnsafeBytes { messageBytes -> UInt8 in
                    if let messageBytesBaseAddress = messageBytes.baseAddress,
                       let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                        let messageLength = CC_LONG(messageData.count)
                        CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                    }
                    return 0
                }
            }
            return digestData.map { String(format: "%02hhx", $0) }.joined()
        }
    
}
