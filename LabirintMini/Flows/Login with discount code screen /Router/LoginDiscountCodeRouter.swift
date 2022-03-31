//
//  LoginDiscountCodeRouter.swift
//  LabirintMini
//
//  Created by homatov on 14.03.2022.
//

import UIKit

final class LoginDiscountCodeRouter {

    weak var view: UIViewController?

}

// MARK: - LoginDiscountCodeRouterInput

extension LoginDiscountCodeRouter: LoginDiscountCodeRouterInput {
    
    func closeModule() {
        view?.dismiss(animated: true)
    }
}
