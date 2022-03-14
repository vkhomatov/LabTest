//
//  CatalogConfigurator.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import Foundation

final class CatalogConfigurator {

    func configure() -> CatalogViewController {
        let view = CatalogViewController()
        let router = CatalogRouter()
        let presenter = CatalogPresenter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

}
