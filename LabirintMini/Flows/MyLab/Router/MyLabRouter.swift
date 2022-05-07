//
//  MyLabRouter.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit

final class MyLabRouter {

    weak var view: UIViewController?

}

// MARK: - MyLabRouterInput

extension MyLabRouter: MyLabRouterInput {
    
    func openLoginScreen(delegate: LoginDiscountCodePresenterDelegate) {
        let module = LoginDiscountCodeConfigurator().configure(delegate: delegate)
        module.modalPresentationCapturesStatusBarAppearance = true
        module.modalPresentationStyle = .overFullScreen
        view?.present(module, animated: true, completion: nil)
    }

}
