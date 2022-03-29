//
//  MyLabPresenter.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import Foundation

final class MyLabPresenter {

    // MARK: - Properties

    weak var view: MyLabViewInput?
    var router: MyLabRouterInput?
    private var state: LoginState
    private let userModel: UserModel
    private var userEntity: UserEntity?
    private var userService: UserServiceProtocol
    private var keyChainService: KeyChainServiceProtocol
    private var parametersService: ParametersServiceProtocol
    
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
        self.parametersService = ParametersService()
        self.userService = UserService()
        self.keyChainService = KeyChainService()
    }

}

// MARK: - MyLabViewOutput

extension MyLabPresenter: MyLabViewOutput {
    
    func viewLoaded() {
        view?.setupViewState(with: state)
        authByQuery()
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

private extension MyLabPresenter {

    func authByQuery() {
        guard let token = try? keyChainService.readToken() else {
            print("Get a token first")
            return
        }

        let discountCode = "0A58-48EE-8006"
        let parametres =  parametersService.makeParams(add: ["token" : token, "code" : discountCode])
        
        userService.auth(with: parametres)
            .onCompleted { [weak self] data in
                self?.userEntity = data
            }.onError { error in
                print(error.localizedDescription)
            }
    }
    
    func authByBody() {
        guard let _ = try? keyChainService.readToken() else {
            print("Get a token first")
            return
        }
        
        let discountCode = "0A58-48EE-8006"
        let parametres =  parametersService.makeParams(add: ["code" : discountCode])
        
        userService.authByBody(with: parametres)
            .onCompleted { [weak self] data in
                self?.userEntity = data
            }.onError { error in
                print(error.localizedDescription)
            }
    }

}
