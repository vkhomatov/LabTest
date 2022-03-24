//
//  KeyChainService.swift
//  LabirintMini
//
//  Created by homatov on 24.03.2022.
//

import Security
import UIKit

enum KeychainError: Error {
    case itemNotFound
    case duplicateItem
    case invalidItemFormat
    case unexpectedStatus(OSStatus)
}

protocol KeyChainServiceProtocol {
    func saveToken(token: String) throws
    func updateToken(token: String) throws
    func readToken() throws -> String
}

final class KeyChainService: KeyChainServiceProtocol {
    
    private let service: String = "ru.surf.LabirintMini.homatov"
    private let account: String = "ru.surf.LabirintMini.homatov"
        
    func saveToken(token: String) throws {

        let tokenData = token.data(using: .utf8)
        
        let query: [String: AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecValueData as String: tokenData as AnyObject
        ]
        
        let status = SecItemAdd(
            query as CFDictionary,
            nil
        )

        if status == errSecDuplicateItem {
            throw KeychainError.duplicateItem
        }

        if status != errSecSuccess {
            throw KeychainError.unexpectedStatus(status)
        } else {
            debugPrint("Token saved in KeyChain")
        }
    }
    
    func updateToken(token: String) throws {
        
        let tokenData = token.data(using: .utf8)

        let query: [String: AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecClass as String: kSecClassGenericPassword
        ]
        
        let attributes: [String: AnyObject] = [
            kSecValueData as String: tokenData as AnyObject
        ]

        let status = SecItemUpdate(
            query as CFDictionary,
            attributes as CFDictionary
        )

        guard status != errSecItemNotFound else {
            throw KeychainError.itemNotFound
        }

        if status != errSecSuccess {
            throw KeychainError.unexpectedStatus(status)
        } else {
            debugPrint("Token updated in KeyChain")
        }
    }
    
    func readToken() throws -> String {

        let query: [String: AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: kCFBooleanTrue
        ]

        var itemCopy: AnyObject?
        let status = SecItemCopyMatching(
            query as CFDictionary,
            &itemCopy
        )

        guard status != errSecItemNotFound else {
            throw KeychainError.itemNotFound
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }

        guard let token = itemCopy as? Data else {
            throw KeychainError.invalidItemFormat
        }
        
        return String(decoding: token, as: UTF8.self)
    }
        
}
