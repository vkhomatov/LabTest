//
//  AuthEntry.swift
//  LabirintMini
//
//  Created by homatov on 25.03.2022.
//

import NodeKit

struct AuthEntry: Codable, RawEncodable {
    typealias Raw = Json
    
    let code: String?// "T25O4-M4AJY-TTTTT",
    let tmpPass: String?//"123456",
    let confirmType: String?//"sms"
    let firstName: String?//"Ivan",
    let lastName: String?//"Petrovich",
    let middleName: String?//"",
    let gender: String?//"female",
    let dob: String?//"1426494564",
    let location: String?//"",
    let avatarUrl: String?//"http://upload.wikimedia.org/wikipedia/en/3/30/AC_Surf_logo.PNG",
    let nickname: String?//"Surf",
    let email: String?//"test@test.ru",
    let vkId: String?//"123",
    let facebookId: String?//"456",
    let twitterId: String?//"789",
    let livejournalId: String?//"101"
    let googleId: String?//"112",
    let okId: String?//"234",
    let mailRuId: String?//"777",
    let yandexPassportId: String?//"123",
    let appleUserString: String?//"000123.a06249abdf1d49dd9bc83b30ed4dac6d.1234",
    let appleUserName: String?//"Test"
}
