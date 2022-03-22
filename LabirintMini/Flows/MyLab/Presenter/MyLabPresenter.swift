//
//  MyLabPresenter.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit

final class MyLabPresenter {

    // MARK: - Properties

    weak var view: MyLabViewInput?
    var router: MyLabRouterInput?
    private var state: LoginState
    private let userData: UserEntity
    
    // MARK: - Initialization

    init() {
        self.userData = .init(name: "Иван Человеков",
                              number: "T25O4-M4AJY-YG5TR",
                              discount: 12,
                              balance: 0,
                              nextDiscount: 5_865,
                              nextDiscountSumm: 15,
                              myOrders: 1,
                              myCoupons: 3,
                              couponsOnFire: 1,
                              myGoods: 367,
                              mySubscriptions: 78,
                              myPurchasedGoods: 1,
                              delivryAddress: "г. Петропавловск, от 1600 р. бесплатно, доставим завтра",
                              pickupPoints: 156)
        
        self.state = .logout(.init(headerViewModel: .init(from: userData), contentViewModel: .init(from: userData)))
    }

}

// MARK: - MyLabViewOutput

extension MyLabPresenter: MyLabViewOutput {
    
    func viewLoaded() {
        view?.setupViewState(with: state)
    }
    
    func exitButtonPush() {
        self.state = .logout(.init(headerViewModel: .init(from: userData), contentViewModel: .init(from: userData)))
        view?.setupViewState(with: state)
    }
    
    func enterButtonPush() {
        self.state = .login(.init(headerViewModel: .init(from: userData), contentViewModel: .init(from: userData)))
        view?.setupViewState(with: state)
    }

}
