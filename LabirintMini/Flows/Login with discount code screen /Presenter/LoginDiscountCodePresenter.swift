//
//  LoginDiscountCodePresenter.swift
//  LabirintMini
//
//  Created by homatov on 14.03.2022.
//

import NodeKit

protocol LoginDiscountCodePresenterDelegate {
    func loadUserModel(userModel: UserModel)
}

final class LoginDiscountCodePresenter {

    // MARK: - Properties

    weak var view: LoginDiscountCodeInput?
    var router: LoginDiscountCodeRouterInput?
    var delegate: LoginDiscountCodePresenterDelegate?
    private var discountCode: String?
    private var userService: UserServiceProtocol
    private var keyChainService: KeyChainServiceProtocol
    private var parametersService: ParametersServiceProtocol
    
    // MARK: - Initialization

    init() {
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
            authByBody(code: code, compleation: { userModel in
                self.delegate?.loadUserModel(userModel: userModel)
                self.closeModule()
            })
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

    func authByBody(code: String, compleation: ((_ userModel: UserModel) -> ())?) {
        guard let token = try? keyChainService.readToken() else {
            showAlert(title: "Авторизация", message: "Ошибка: Токен не найден")
            return
        }

        let discountCode = code // рабочий код "0A58-48EE-8006"
        let parametres =  parametersService.makeParams(add: ["token" : token, "code" : discountCode])
        
        blockScreen(block: true)
                
        userService.loginWithBody(with: parametres, code: discountCode)
            .onCompleted { [weak self] data in
                self?.blockScreen(block: false)
                compleation?(.init(userEntity: data))
            }.onError { [weak self] error in
                self?.showAlert(title: "Авторизация", message: "Ошибка: " + error.localizedDescription.description)
                self?.blockScreen(block: false)
            }
    }

}
