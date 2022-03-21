//
//  MyLabViewModelBuilder.swift
//  LabirintMini
//
//  Created by homatov on 11.03.2022.
//

import UIKit
import ReactiveDataDisplayManager


struct MyLabCellsDataModel {
    let myOrders: Int
    let myCoupons: Int
    let couponsOnFire: Int
    let myGoods: Int
    let mySubscriptions: Int
    let myPurchasedGoods: Int
    let delivryAddress: String
    let pickupPoints: Int
    
    init(myOrders: Int = 1,
         myCoupons: Int = 3,
         couponsOnFire: Int = 1,
         myGoods: Int = 367,
         myPurchasedGoods: Int = 1,
         mySubscriptions: Int = 78,
         delivryAddress: String = "г. Петропавловск, от 1600 р. бесплатно, доставим завтра",
         pickupPoints: Int = 156)
    {
        self.myOrders = myOrders
        self.myCoupons = myCoupons
        self.couponsOnFire = couponsOnFire
        self.myGoods = myGoods
        self.myPurchasedGoods = myPurchasedGoods
        self.mySubscriptions = mySubscriptions
        self.delivryAddress = delivryAddress
        self.pickupPoints = pickupPoints
    }
}

enum LoginState {
    case login(headerModel: MyLabAutorizedHeaderDataModel = MyLabAutorizedHeaderDataModel(), cellModels: [CellViewModel] = [])
    case logout(cellModels: [CellViewModel] = [])
}

final class MyLabViewModelBuilder {

    // MARK: - Properties
    
    private var state: LoginState
    private var generators: [TableCellGenerator] = [TableCellGenerator]()
    
    // MARK: - Initialization

    init(with state: LoginState) {
        self.state = state
    }
    
}

// MARK: - Extension

extension MyLabViewModelBuilder {
    
    func makeHeader() -> TableHeaderGenerator {
        switch state {
        case .logout:
            return UnautorizedHeaderGenerator()
        case .login(let headerModel, _):
            return AutorizedHeaderGenerator(model: headerModel)
        }
    }
    
    func makeCellsGenerators() -> [TableCellGenerator] {
        switch state {
        case .logout(let models):
            generators = [BaseNonReusableCellGenerator<DeliveryAddressCell>(with: models[0]),
                          BaseCellGenerator<StandartReusableCell>(with: models[1]),
                          BaseCellGenerator<StandartReusableCell>(with: models[2])]
        case .login(_, let models):
            generators = [BaseCellGenerator<StandartReusableCell>(with: models[0]),
                          BaseCellGenerator<StandartReusableCell>(with: models[1]),
                          BaseCellGenerator<StandartReusableCell>(with: models[2]),
                          BaseCellGenerator<StandartReusableCell>(with: models[3]),
                          BaseCellGenerator<StandartReusableCell>(with: models[4]),
                          BaseCellGenerator<StandartReusableCell>(with: models[5]),
                          BaseNonReusableCellGenerator<DeliveryAddressCell>(with: models[6]),
                          BaseCellGenerator<StandartReusableCell>(with: models[7]),
                          BaseCellGenerator<StandartReusableCell>(with: models[8]),
                          BaseCellGenerator<StandartReusableCell>(with: models[9]),
                          BaseCellGenerator<StandartReusableCell>(with: models[10]),
                          BaseNonReusableCellGenerator<ExitButtonCell>(with: models[11])]
        }
        return generators
    }

}
