//
//  AuthEntity.swift
//  LabirintMini
//
//  Created by homatov on 25.03.2022.
//

import NodeKit

struct AuthEntity: DTOEncodable {

    var code: String? = nil
    let tmpPass: String? = nil
    let confirmType: String? = nil
    let firstName: String? = nil
    let lastName: String? = nil
    let middleName: String? = nil
    let gender: String? = nil
    let dob: String? = nil
    let location: String? = nil
    let avatarUrl: String? = nil
    let nickname: String? = nil
    let email: String? = nil
    let vkId: String? = nil
    let facebookId: String? = nil
    let twitterId: String? = nil
    let livejournalId: String? = nil
    let googleId: String? = nil
    let okId: String? = nil
    let mailRuId: String? = nil
    let yandexPassportId: String? = nil
    let appleUserString: String? = nil
    let appleUserName: String? = nil

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
