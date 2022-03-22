//
//  MyLabViewBuilder.swift
//  LabirintMini
//
//  Created by homatov on 11.03.2022.
//

import UIKit
import ReactiveDataDisplayManager

enum MyLabRowTypes: String {
    case myOrders
    case myCoupons
    case myGoods
    case mySubscription
    case purchasedGoods
    case myReviews
    case pickupPoints
    case profileSetting
    case appSetting
    case aboutStore
    case delivery
}

enum LoginState {
    case login(MyLabViewModel)
    case logout(MyLabViewModel)
}

struct MyLabViewModel {
    var headerViewModel: MyLabAuthorizedHeaderDataModel
    var contentViewModel: MyLabCellsDataModel
}

final class MyLabViewBuilder {
    
    // MARK: - Constants
    
    enum Constants {
        static let greyColor = UIColor(red: 0.616, green: 0.616, blue: 0.616, alpha: 1)
    }

    // MARK: - Properties
    
    var didPushCellCallback: ((_ cellType: MyLabRowTypes) -> Void)?
    var exitButtonCallback: (() -> Void)?
    var enterButtonCallback: (() -> Void)?
    
}

// MARK: - Extension

extension MyLabViewBuilder {
    
    func makeHeader(with state: LoginState) -> TableHeaderGenerator {
        switch state {
        case .logout:
            let generator = UnautorizedHeaderGenerator()
            if let header = generator.generate() as? UnautorizedHeaderView {
                header.enterButtonCallback = { [weak self] in
                    self?.enterButtonCallback?()
                }
            }
            return generator
        case .login(let model):
            return AutorizedHeaderGenerator(model: model.headerViewModel)
        }
    }
    
    func makeDeliveryCell(with state: LoginState) -> BaseNonReusableCellGenerator<DeliveryAddressCell> {
        switch state {
        case .logout(let model):
            let deliveryModel = MyLabCellViewModel(title: L10n.MyLab.delivery, value: model.contentViewModel.delivryAddress, roundСorners: true)
            let generator = BaseNonReusableCellGenerator<DeliveryAddressCell>(with: deliveryModel)
            generator.cell?.didPushCallback = { [weak self] in
                self?.didPushCellCallback?(.delivery)
            }
            return generator
        case .login(let model):
            let deliveryModel = MyLabCellViewModel(title: L10n.MyLab.delivery, value: model.contentViewModel.delivryAddress)
            let generator = BaseNonReusableCellGenerator<DeliveryAddressCell>(with: deliveryModel)
            generator.cell?.didPushCallback = { [weak self] in
                self?.didPushCellCallback?(.delivery)
            }
            return generator
        }
    }

    func makeExitCell(with state: LoginState) -> BaseNonReusableCellGenerator<ExitButtonCell> {
        let generator = BaseNonReusableCellGenerator<ExitButtonCell>(with: .init(title: L10n.MyLab.logout))
        generator.cell?.exitButtonCallback = { [weak self] in
            self?.exitButtonCallback?()
        }
        return generator
    }
    
    func makeBaseCell(from type: MyLabRowTypes, model: MyLabCellViewModel) -> BaseNonReusableCellGenerator<MyLabStandartReusableCell> {
        let generator = BaseNonReusableCellGenerator<MyLabStandartReusableCell>(with: model)
        generator.cell?.didPushCallback = { [weak self] in
            self?.didPushCellCallback?(type)
        }
        return generator
    }
    
    func makeCellsContent(with state: LoginState) -> [TableCellGenerator] {
        switch state {
        case .logout(_):
            let generators = [makeDeliveryCell(with: state),
                              makeBaseCell(from: .appSetting, model: .init(title: L10n.MyLab.appSettings)),
                              makeBaseCell(from: .aboutStore, model: .init(title: L10n.MyLab.storeInformation))] as [TableCellGenerator]
            return generators
        case .login(let model):
            let generators = [makeBaseCell(from: .myOrders, model: .init(title: L10n.MyLab.myOrders, value: String(model.contentViewModel.myOrders) + L10n.MyLab.inProcessing, roundСorners: true)),
                              makeBaseCell(from: .myCoupons, model: .init(title: L10n.MyLab.myCoupons, value: String(model.contentViewModel.myCoupons) + L10n.MyLab.inFire)),
                              makeBaseCell(from: .myGoods, model: .init(title: L10n.MyLab.savingGoods, value: String(model.contentViewModel.myGoods), valueTextColor: Constants.greyColor)),
                              makeBaseCell(from: .mySubscription, model: .init(title: L10n.MyLab.mySubscriptions, value: String(model.contentViewModel.mySubscriptions) + L10n.MyLab.updates)),
                              makeBaseCell(from: .purchasedGoods, model: .init(title: L10n.MyLab.purchasedGoods)),
                              makeBaseCell(from: .myReviews, model: .init(title: L10n.MyLab.myReviews)),
                              makeDeliveryCell(with: state),
                              makeBaseCell(from: .pickupPoints, model: .init(title: String(model.contentViewModel.pickupPoints) + L10n.MyLab.pickupPoints)),
                              makeBaseCell(from: .profileSetting, model: .init(title: L10n.MyLab.profileSettings)),
                              makeBaseCell(from: .appSetting, model: .init(title: L10n.MyLab.appSettings)),
                              makeBaseCell(from: .aboutStore, model: .init(title: L10n.MyLab.storeInformation)),
                              makeExitCell(with: state)] as [TableCellGenerator]
            return generators
        }
    }

}
