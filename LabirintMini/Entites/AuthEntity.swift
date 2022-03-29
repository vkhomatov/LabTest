//
//  AuthEntity.swift
//  LabirintMini
//
//  Created by homatov on 25.03.2022.
//

import NodeKit

struct AuthEntity: DTOEncodable {

    var code: String? = nil// "T25O4-M4AJY-TTTTT",
    let tmpPass: String? = nil//"123456",
    let confirmType: String? = nil//"sms"
    let firstName: String? = nil//"Ivan",
    let lastName: String? = nil//"Petrovich",
    let middleName: String? = nil//"",
    let gender: String? = nil//"female",
    let dob: String? = nil//"1426494564",
    let location: String? = nil//"",
    let avatarUrl: String? = nil//"http://upload.wikimedia.org/wikipedia/en/3/30/AC_Surf_logo.PNG",
    let nickname: String? = nil//"Surf",
    let email: String? = nil//"test@test.ru",
    let vkId: String? = nil//"123",
    let facebookId: String? = nil//"456",
    let twitterId: String? = nil//"789",
    let livejournalId: String? = nil//"101"
    let googleId: String? = nil//"112",
    let okId: String? = nil//"234",
    let mailRuId: String? = nil//"777",
    let yandexPassportId: String? = nil//"123",
    let appleUserString: String? = nil//"000123.a06249abdf1d49dd9bc83b30ed4dac6d.1234",
    let appleUserName: String? = nil//"Test"

    func toDTO() throws -> AuthEntry {
        return .init(code: self.code,
                     tmpPass: self.tmpPass,
                     confirmType: self.confirmType,
                     firstName: self.firstName,
                     lastName: self.lastName,
                     middleName: self.middleName,
                     gender: self.gender,
                     dob: self.dob,
                     location: self.location,
                     avatarUrl: self.avatarUrl,
                     nickname: self.nickname,
                     email: self.email,
                     vkId: self.vkId,
                     facebookId: self.facebookId,
                     twitterId: self.twitterId,
                     livejournalId: self.livejournalId,
                     googleId: self.googleId,
                     okId: self.okId,
                     mailRuId: self.mailRuId,
                     yandexPassportId: self.yandexPassportId,
                     appleUserString: self.appleUserString,
                     appleUserName: self.appleUserName)
    }
}
