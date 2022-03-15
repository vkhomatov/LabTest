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

}

// MARK: - LabirintViewOutput

extension LoginDiscountCodePresenter: LoginDiscountCodeOutput {

    func viewLoaded() { }
    
    func closeModule() {
        router?.closeModule()
    }

}
