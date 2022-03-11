//
//  MyLabConfigurator.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit

final class MyLabConfigurator {

    func configure(state: LogState) -> MyLabViewController {
        let view = MyLabViewController()
        let router = MyLabRouter()
        let presenter = MyLabPresenter(state: state)

        presenter.view = view
        presenter.router = router
        router.view = view
        view.output = presenter

        return view
    }

}
