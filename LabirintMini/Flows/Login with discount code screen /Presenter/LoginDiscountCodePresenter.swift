//
//  LoginDiscountCodePresenter.swift
//  LabirintMini
//
//  Created by homatov on 14.03.2022.
//

import NodeKit

final class LoginDiscountCodePresenter {
    
    // MARK: - Properties

    weak var view: LoginDiscountCodeInput?
    var router: LoginDiscountCodeRouterInput?
    private var discountCode: String?
    
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
        
        self.parametersService = ParametersService()
        self.userService = UserService()
        self.keyChainService = KeyChainService()
    }

}

// MARK: - LoginDiscountCodeOutput

extension LoginDiscountCodePresenter: LoginDiscountCodeOutput {

    func viewLoaded() { }
    
    func closeModule() {
        router?.closeModule()
    }
    
    func textDidChange(_ text: String) {
        discountCode = text
    }

    func editingDidBegin(_ text: String) {
        discountCode = text
    }
    
    func editingDidEnd(_ text: String) {
        discountCode = text
    }

    func loginButtonPush() {
        if let code = discountCode, code != "" {
            authByBody(code: code)
        } else {
            setCodeTextEditErrorState()
        }
    }

}

// MARK: - LoginDiscountCodeInput

extension LoginDiscountCodePresenter: LoginDiscountCodeInput {

    func blockScreen(block: Bool) {
        view?.blockScreen(block: block)
    }

    func setCodeTextEditErrorState() {
        view?.setCodeTextEditErrorState()
    }
    
    func showAlert(title: String, message: String) {
        view?.showAlert(title: title, message: message)
    }

}

private extension LoginDiscountCodePresenter {

    func authByQuery(code: String) {
        guard let token = try? keyChainService.readToken() else {
            showAlert(title: "Авторизация", message: "Ошибка: Токен не найден")
            return
        }

        let discountCode = code // "0A58-48EE-8006"
        let parametres =  parametersService.makeParams(add: ["token" : token, "code" : discountCode])
        
        blockScreen(block: true)
                
        userService.login(with: parametres)
            .onCompleted { [weak self] data in
                self?.userEntity = data
                self?.blockScreen(block: false)
            }.onError { [weak self] error in
                self?.showAlert(title: "Авторизация", message: "Ошибка: " + error.localizedDescription.description)
                self?.blockScreen(block: false)
            }
    }
    
    func authByBody(code: String) {
        guard let token = try? keyChainService.readToken() else {
            showAlert(title: "Авторизация", message: "Ошибка: Токен не найден")
            return
        }

        let discountCode = code // рабочий код "0A58-48EE-8006"
        let parametres =  parametersService.makeParams(add: ["token" : token, "code" : discountCode])
        
        blockScreen(block: true)
                
        userService.loginWithBody(with: parametres, code: discountCode)
            .onCompleted { [weak self] data in
                self?.userEntity = data
                self?.blockScreen(block: false)
            }.onError { [weak self] error in
                self?.showAlert(title: "Авторизация", message: "Ошибка: " + error.localizedDescription.description)
                self?.blockScreen(block: false)
            }
    }
    

}
