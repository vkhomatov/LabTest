//
//  LoginDiscountCodeConfigurator.swift
//  LabirintMini
//
//  Created by homatov on 14.03.2022.
//

import UIKit

final class LoginDiscountCodeConfigurator {
    
    func configure() -> LoginDiscountCodeViewController {
        let view = LoginDiscountCodeViewController()
        let router = LoginDiscountCodeRouter()
        let presenter = LoginDiscountCodePresenter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

    
}
