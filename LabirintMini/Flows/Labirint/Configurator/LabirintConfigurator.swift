//
//  LabirintConfigurator.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import Foundation

final class LabirintConfigurator {

    func configure() -> LabirintViewController {
        let view = LabirintViewController()
        let router = LabirintRouter()
        let presenter = LabirintPresenter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

}
