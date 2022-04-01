//
//  UserEntry.swift
//  LabirintMini
//
//  Created by homatov on 25.03.2022.
//

import NodeKit

struct Phones: Codable, RawDecodable {
    typealias Raw = Json

    let phoneId: Int
    let countryCode: String
    let phoneNumber: String
}

struct User: Codable, RawDecodable {
    typealias Raw = Json

    let userId: String
    let token: String
    let firstName: String
    let lastName: String
    let patronymic: String
    let email: String
    let gender: String
    let phones: [Phones]
    let nickname: String
    let avatarUrl: String
    let dob: String?
    let birthdayDiscount: Int
    let birthdayDiscountExpiringDate: Int
    let canEditDob: Bool
    let canEditCode: Bool
    let code: String
    let personalDiscount: Int
    let isNewUser: Bool
    let currentBalance: Int
    let expiringBalance: Int
    let prizePoints: Int
    let expiringPrizePoints: Int
    let ordersCount: Int
    let currentOrdersCount: Int
    let ordersStatus: String
    let lastModifiedWithOrder: String
    let reviewsCount: Int?
    let deliveryMainTitle: String
    let deliveryMainDescription: String
    let invitedFriendsCount: Int
    let invitationBonus: Int
    let invitationAlert: String?
    let balanceUrl: String
    let vkId: String?
    let facebookId: String?
    let twitterId: String?
    let livejournalId: String?
    let googleId: String?
    let okId: String?
    let yandexPassportId: String?
    let mailRuId: String?
    let huaweiId: String?
    let appleUserString: Int?
    let vkName: String?
    let facebookName: String?
    let twitterName: String?
    let livejournalName: String?
    let googleName: String?
    let okName: String?
    let mailRuName: String?
    let yandexPassportName: String?
    let huaweiName: Int?
    let appleUserName: Int?
    let region: Region
    let paidOrderInfo: String
    let nextDiscountInfo: String
    let authorId: Int
    let haveBalanceHistory: Bool
    let couponsStatus: String
    let couponsCount: Int
    let couponsActive: Int
    let complitedOrdersCount: Int
    let processingOrdersCount: Int
    let cancelledOrdersCount: Int
    let firstDateOrder: Int
    let refContact: String
    let isPartner: Bool
    let hasRecommendations: Bool
    let recommendationType: String
    let coupons: [String]
    let couponsInfo: String
    let cashback: Int?
    let subscriptionsCount: Int
    let orderBadgeCount: Int
    let actionBadgeCount: Int
    let deferredAvailableBadgeCount: Int
    let implicitActionsBadgeCount: Int
    let basketAvailableBadgeCount: Int
    let subscriptionsAvailableBadgeCount: Int
    let basketProductsCount: Int
    let deferredProductsCount: Int
    let couponsBurning: Int
}

struct UserEntry: Codable, RawDecodable {
    typealias Raw = Json

    let user: User
    let developerMessage: String
    let userMessage: String
    let errorCode: Int
    let _metadata: MetaData
}
