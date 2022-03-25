//
//  MyLabViewBuilder.swift
//  LabirintMini
//
//  Created by homatov on 11.03.2022.
//

import UIKit
import ReactiveDataDisplayManager

struct MyLabViewModel {
    var headerViewModel: MyLabAuthorizedHeaderDataModel
    var contentViewModel: MyLabStandartCellModel
}

final class MyLabViewBuilder {

    // MARK: - Properties
    
    var didPushCellCallback: ((_ cellType: MyLabRowTypes) -> Void)?
    var exitButtonCallback: (() -> Void)?
    var enterButtonCallback: (() -> Void)?
    
}

// MARK: - Extension

extension MyLabViewBuilder {
    
    func makeHeaderGenerator(with state: LoginState) -> TableHeaderGenerator {
        switch state {
        case .logout:
            let generator = UnautorizedHeaderGenerator()
            generator.viewButtonCallback = { [weak self] in
                self?.enterButtonCallback?()
            }
            return generator
        case .login(let model):
            return AutorizedHeaderGenerator(model: model.headerViewModel)
        }
    }

    func makeDeliveryGenerator(model: MyLabCellViewModel) -> TableCellGenerator {
        let generator = BaseNonReusableCellGenerator<DeliveryAddressCell>(with: model)
        generator.cell?.didPushCallback = { [weak self] in
            self?.didPushCellCallback?(.delivery)
        }
        return generator
    }
    
    func makeExitGenerator(model: MyLabCellViewModel) -> TableCellGenerator {
        let generator = BaseNonReusableCellGenerator<ExitButtonCell>(with: model)
        generator.cell?.exitButtonCallback = { [weak self] in
            self?.exitButtonCallback?()
        }
        return generator
    }
    
    func makeBaseGenerator(model: MyLabCellViewModel) -> TableCellGenerator {
        let generator = BaseNonReusableCellGenerator<MyLabStandartCell>(with: model)
        generator.cell?.didPushCallback = { [weak self ] in
            self?.didPushCellCallback?(model.type)
        }

        return generator
    }
    
    func makeCellsContent(with state: LoginState) -> [TableCellGenerator] {
        switch state {
        case .logout(let model):
            let generators = [makeDeliveryGenerator(model: .init(type: .delivery, value: model.contentViewModel.delivryAddress, roundСorners: true)),
                              makeBaseGenerator(model: .init(type: .appSetting)),
                              makeBaseGenerator(model: .init(type: .aboutStore))]
            return generators
        case .login(let model):
            let generators = [makeBaseGenerator(model: .init(type: .myOrders, value: L10n.MyLab.inProcessing(model.contentViewModel.myOrders), roundСorners: true)),
                              makeBaseGenerator(model: .init(type: .myCoupons, value: L10n.MyLab.inFire(model.contentViewModel.myCoupons))),
                              makeBaseGenerator(model: .init(type: .myGoods, value: String(model.contentViewModel.myGoods), valueTextColor: .gray)),
                              makeBaseGenerator(model: .init(type: .mySubscription, value: L10n.MyLab.updates(model.contentViewModel.mySubscriptions))),
                              makeBaseGenerator(model: .init(type: .purchasedGoods)),
                              makeBaseGenerator(model: .init(type: .myReviews)),
                              makeDeliveryGenerator(model: .init(type: .delivery, value: model.contentViewModel.delivryAddress)),
                              makeBaseGenerator(model: .init(type: .pickupPoints(String(model.contentViewModel.pickupPoints)))),
                              makeBaseGenerator(model: .init(type: .profileSetting)),
                              makeBaseGenerator(model: .init(type: .appSetting)),
                              makeBaseGenerator(model: .init(type: .aboutStore)),
                              makeExitGenerator(model: .init(type: .logout))]
            return generators
        }
    }

}
