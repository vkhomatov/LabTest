//
//  MyLabConfigurator.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit

final class MyLabConfigurator {

    func configure() -> MyLabViewController {
        let view = MyLabViewController()
        let router = MyLabRouter()
        let presenter = MyLabPresenter()

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

}
