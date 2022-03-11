//
//  MyLabViewModel.swift
//  LabirintMini
//
//  Created by homatov on 11.03.2022.
//

import UIKit
import ReactiveDataDisplayManager


enum ResuableRowTypes {
    case myOrders
    case myCoupons
    case savingGoods
    case mySubscription
    case purchasedGoods
    case myReviews
    case pickupPoints
    case profileSetting
    case appSetting
    case aboutStore
}

enum HeaderTypes {
    case logoutHeader
    case loginHeader
}

final class MyLabViewModel {

    // MARK: - Properties

    var state: LogState
    
    // MARK: - Initialization

    init(_ state: LogState) {
        self.state = state
    }
    
}

// MARK: - Extension

extension MyLabViewModel {
    
    func makeHeader(with type: HeaderTypes) -> TableHeaderGenerator {
        switch type {
        case .logoutHeader:
            return UnautorizedHeaderGenerator()
        case .loginHeader:
            return AutorizedHeaderGenerator()
        }
    }
    
    func makeDeliveryRow(_ state: LogState) -> BaseNonReusableCellGenerator<DeliveryAddressCell> {
        let deliveryModel = DeliveryAddressCellViewModel(title: L10n.delivery, address: "г. Петропавловск, от 1600 р. бесплатно, доставим завтра", state: state)
        return BaseNonReusableCellGenerator<DeliveryAddressCell>(with: deliveryModel)
    }

    func makeExitRow() -> BaseNonReusableCellGenerator<ExitButtonCell> {
        let model = ExitButtonCellViewModel(title: L10n.logout)
        return BaseNonReusableCellGenerator<ExitButtonCell>(with: model)
    }
    
    func makeStandartRow(with type: ResuableRowTypes) -> BaseCellGenerator<StandartReusableCell> {
        switch type {
        case .myOrders:
            let myOrdersModel = StandartReusableCellViewModel(title: L10n.myOrders, value: "1 в обработке")
            return BaseCellGenerator<StandartReusableCell>(with: myOrdersModel)
        case .myCoupons:
            let myCouponsModel = StandartReusableCellViewModel(title: L10n.myCoupons, value: "1 сгорает")
            return BaseCellGenerator<StandartReusableCell>(with: myCouponsModel)
        case .savingGoods:
            let savingGoodsModel = StandartReusableCellViewModel(title: L10n.savingGoods, value: "367", valueTextColor: StandartReusableCell.Constants.greyColor)
            return BaseCellGenerator<StandartReusableCell>(with: savingGoodsModel)
        case .mySubscription:
            let mySubscriptionsModel = StandartReusableCellViewModel(title: L10n.mySubscriptions, value: "78 обновлений")
            return BaseCellGenerator<StandartReusableCell>(with: mySubscriptionsModel)
        case .purchasedGoods:
            let purchasedGoodsModel = StandartReusableCellViewModel(title: L10n.purchasedGoods)
            return BaseCellGenerator<StandartReusableCell>(with: purchasedGoodsModel)
        case .myReviews:
            let myReviewsModel = StandartReusableCellViewModel(title: L10n.myReviews)
            return BaseCellGenerator<StandartReusableCell>(with: myReviewsModel)
        case .pickupPoints:
            let pickupPointsModel = StandartReusableCellViewModel(title: L10n._156PickupPoints)
            return BaseCellGenerator<StandartReusableCell>(with: pickupPointsModel)
        case .profileSetting:
            let profileSettingsModel = StandartReusableCellViewModel(title: L10n.profileSettings)
            return BaseCellGenerator<StandartReusableCell>(with: profileSettingsModel)
        case .appSetting:
            let appSettingsModel = StandartReusableCellViewModel(title: L10n.appSettings)
            return BaseCellGenerator<StandartReusableCell>(with: appSettingsModel)
        case .aboutStore:
            let aboutStoreModel = StandartReusableCellViewModel(title: L10n.storeInformation)
            return BaseCellGenerator<StandartReusableCell>(with: aboutStoreModel)
        }
    }

}
