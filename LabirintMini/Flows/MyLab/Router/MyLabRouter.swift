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
    
    func openLoginScreen() {
        let module = LoginDiscountCodeConfigurator().configure()
        module.modalPresentationCapturesStatusBarAppearance = true
        module.modalPresentationStyle = .overFullScreen
        view?.present(module, animated: true, completion: nil)
    }

}
