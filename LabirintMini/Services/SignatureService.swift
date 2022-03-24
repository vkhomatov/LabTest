//
//  SignatureService.swift
//  LabirintMini
//
//  Created by homatov on 23.03.2022.
//

protocol SignatureServiceProtocol {
    func getParamString(parameters: [String : String]) -> String
    func getMD5Signature(strParameters: String) -> String
}

final class SignatureService: SignatureServiceProtocol {
    
    private let privateKey = "ee60a7d05bde179ac717697efdcc8f09"

    func getParamString(parameters: [String : String]) -> String {
        let sortingDict = parameters.sorted { $0.key < $1.key }
        return sortingDict.map { $0.key + $0.value }.joined(separator: "") + privateKey
    }
    
    func getMD5Signature(strParameters: String) -> String {
        return String(strParameters.utf8.md5)
    }
    
}
