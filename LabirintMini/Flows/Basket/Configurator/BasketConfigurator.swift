//
//  BasketConfigurator.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import Foundation

final class BasketConfigurator {

    func configure() -> BasketViewController {
        let view = BasketViewController()
        let router = BasketRouter()
        let presenter = BasketPresenter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

}
