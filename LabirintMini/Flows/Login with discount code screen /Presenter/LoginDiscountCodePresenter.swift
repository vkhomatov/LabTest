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
    private var discountCode: String?

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
    

}
