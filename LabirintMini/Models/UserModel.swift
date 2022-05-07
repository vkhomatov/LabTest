//
//  UserModel.swift
//  LabirintMini
//
//  Created by homatov on 22.03.2022.
//

struct UserModel {
    var name: String?
    var number: String?
    var discount: Int?
    var balance: Int?
    var nextDiscount: String?
    var nextDiscountSumm: Int?
    var myOrders: Int?
    var myCoupons: Int?
    var couponsOnFire: Int?
    var myGoods: Int?
    var mySubscriptions: Int?
    var myPurchasedGoods: Int?
    var delivryAddress: String?
    var pickupPoints: Int?
    
    init(region: Region) {
        self.delivryAddress = (region.deliveryDateString ?? "") + " " + (region.regionName ?? "")
    }
    
    init(userEntity: UserEntity) {
        self.name = (userEntity.user?.firstName ?? "") + " " + (userEntity.user?.lastName ?? "")
        self.number = userEntity.user?.code
        self.discount = userEntity.user?.personalDiscount
        self.balance = userEntity.user?.currentBalance
        self.nextDiscount = userEntity.user?.nextDiscountInfo
        self.nextDiscountSumm = userEntity.user?.personalDiscount
        self.myOrders = userEntity.user?.ordersCount
        self.myCoupons = userEntity.user?.couponsCount
        self.couponsOnFire = userEntity.user?.couponsBurning
        self.myGoods = userEntity.user?.basketProductsCount
        self.mySubscriptions = userEntity.user?.subscriptionsCount
        self.myPurchasedGoods = userEntity.user?.currentOrdersCount
        self.delivryAddress = userEntity.user?.deliveryMainDescription
        self.pickupPoints = userEntity.user?.deferredProductsCount
    }
    
}
