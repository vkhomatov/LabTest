//
//  PromoConfigurator.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import Foundation

final class PromoConfigurator {

    func configure() -> PromoViewController {
        let view = PromoViewController()
        let router = PromoRouter()
        let presenter = PromoPresenter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

}
