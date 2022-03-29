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

    let userId: String//"q0Xeu6/fwXVk4gFDHTi3zw==",
    let token: String//"e1cc9b6fcef3cadff725f8847a3ae544",
    let firstName: String//"Марина",
    let lastName: String//"Зайцева",
    let patronymic: String//"",
    let email: String//"_test_@mail.ru",
    let gender: String//"female",
    let phones: Phones
    let nickname: String//"Зайцева Марина",
    let avatarUrl: String//"https://img.labirint.ru/design/unlogged-user.png",
    let dob: String?
    let birthdayDiscount: Int
    let birthdayDiscountExpiringDate: Int//1610139599
    let canEditDob: Bool
    let canEditCode: Bool
    let code: String//"46B2-4C00-1111",
    let personalDiscount: Int//5,
    let isNewUser: Bool//false,
    let currentBalance: Int//36,
    let expiringBalance: Int//0,
    let prizePoints: Int//,
    let expiringPrizePoints: Int//0,
    let ordersCount: Int//235,
    let currentOrdersCount: Int//0,
    let ordersStatus: String//"",
    let lastModifiedWithOrder: String//"",
    let reviewsCount: Int//9,
    let deliveryMainTitle: String//"Доставка: Москва",
    let deliveryMainDescription: String//"доставим 7 фев., от 800 р. бесплатно",
    let invitedFriendsCount: Int//0,
    let invitationBonus: Int//0,
    let invitationAlert: String//"",
    let balanceUrl: String//"http://www.labirint.ru/cabinet/balance/",
    let vkId: String?//null,
    let facebookId: String?//,
    let twitterId: String?//null,
    let livejournalId: String?//null,
    let googleId: String?//null,
    let okId: String?//null,
    let yandexPassportId: String?//null,
    let mailRuId: String?//null,
    let huaweiId: String?//null,
    let appleUserString: String//"000726.a06249abdf1d49dd9bc83b30ed4dac6d.1234",
    let vkName: String?//null,
    let facebookName: String?//null,
    let twitterName: String?//null,
    let livejournalName: String?//null,
    let googleName: String?//null,
    let okName: String?//null,
    let mailRuName: String?//null,
    let yandexPassportName: String?//null,
    let huaweiName: String?//null,
    let appleUserName: String//"",
    let region: Region
    let paidOrderInfo: String//"4 заказа на 3 822 р.",
    let nextDiscountInfo: String//"678 р. до увеличения скидки до 6%",
    let authorId: Int//5329926,
    let haveBalanceHistory: Bool//true,
    let couponsStatus: String//"",
    let couponsCount: Int//7,
    let couponsActive: Int//1,
    let complitedOrdersCount: Int//4,
    let processingOrdersCount: Int//0,
    let cancelledOrdersCount: Int//231,
    let firstDateOrder: Int//1498149089,
    let refContact: String//"",
    let isPartner: Bool//false,
    let hasRecommendations: Bool//false,
    let recommendationType: String//"",
    let coupons: [String]
    let couponsInfo: String//"",
    let cashback: Int//null,
    let subscriptionsCount: Int//,
    let orderBadgeCount: Int//0,
    let actionBadgeCount: Int//0,
    let deferredAvailableBadgeCount: Int//0,
    let implicitActionsBadgeCount: Int//0,
    let basketAvailableBadgeCount: Int//,
    let subscriptionsAvailableBadgeCount: Int//0,
    let basketProductsCount: Int//11,
    let deferredProductsCount: Int//80
}

struct UserEntry: Codable, RawDecodable {
    typealias Raw = Json

    let user: User
    let developerMessage: String
    let userMessage: String
    let errorCode: Int
    let _metadata: MetaData
}


//{
//  "regionId": 182386,
//  "mo": true,
//  "regionName": "г. Москва",
//  "isRussia": 1,
//  "deliveryDateString": "Доставим 7 фев.",
//  "haveExWorks": true,
//  "haveNewExw": true,
//  "exwLastUpdate": 1611058339,
//  "newExwCount": 5,
//  "exWorksCount": 2985,
//  "zipCode": 101000
//},
