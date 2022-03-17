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

// MARK: - LabirintRouterInput

extension LoginDiscountCodeRouter: LoginDiscountCodeRouterInput {
    
    func closeModule() {
        //view?.navigationController?.popViewController(animated: true)
        view?.dismiss(animated: true)
    }
}
