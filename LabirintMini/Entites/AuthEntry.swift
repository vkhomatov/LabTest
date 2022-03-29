//
//  AuthEntry.swift
//  LabirintMini
//
//  Created by homatov on 25.03.2022.
//

import NodeKit

struct AuthEntry: Codable, RawEncodable {
    typealias Raw = Json
    
    let code: String?
    let tmpPass: String?
    let confirmType: String?
    let firstName: String?
    let lastName: String?
    let middleName: String?
    let gender: String?
    let dob: String?
    let location: String?
    let avatarUrl: String?
    let nickname: String?
    let email: String?
    let vkId: String?
    let facebookId: String?
    let twitterId: String?
    let livejournalId: String?
    let googleId: String?
    let okId: String?
    let mailRuId: String?
    let yandexPassportId: String?
    let appleUserString: String?
    let appleUserName: String?
}
