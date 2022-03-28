//
//  LoginDiscountCodePresenter.swift
//  LabirintMini
//
//  Created by homatov on 14.03.2022.
//

import Foundation

final class LoginDiscountCodePresenter {
    
    // MARK: - Properties

    weak var view: LoginDiscountCodeInput?
    var router: LoginDiscountCodeRouterInput?
    var discountCode: String?

}

// MARK: - LabirintViewOutput

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
    

}
