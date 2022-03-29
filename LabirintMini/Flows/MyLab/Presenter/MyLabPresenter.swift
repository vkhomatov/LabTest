//
//  MyLabPresenter.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

final class MyLabPresenter {

    // MARK: - Properties

    weak var view: MyLabViewInput?
    var router: MyLabRouterInput?
    private var state: LoginState
    private let userModel: UserModel
    
    // MARK: - Initialization

    init() {
        self.userModel = .init(name: "Иван Человеков",
                              number: "T25O4-M4AJY-YG5TR",
                              discount: 12,
                              balance: 0,
                              nextDiscount: 15,
                              nextDiscountSumm: 5_865,
                              myOrders: 1,
                              myCoupons: 3,
                              couponsOnFire: 1,
                              myGoods: 367,
                              mySubscriptions: 78,
                              myPurchasedGoods: 1,
                              delivryAddress: "г. Петропавловск, от 1600 р. бесплатно, доставим завтра",
                              pickupPoints: 156)
        
        self.state = .logout(.init(headerViewModel: .init(from: userModel), contentViewModel: .init(from: userModel)))
    }

}

// MARK: - MyLabViewOutput

extension MyLabPresenter: MyLabViewOutput {
    
    func viewLoaded() {
        view?.setupViewState(with: state)
    }
    
    func exitButtonPush() {
        self.state = .logout(.init(headerViewModel: .init(from: userModel), contentViewModel: .init(from: userModel)))
        view?.setupViewState(with: state)
    }
    
    func enterButtonPush() {
        router?.openLoginScreen()
    }
    
    func cellPressed(of type: MyLabRowTypes) {
        print("Cell of type \(type) pressed")
    }

}
