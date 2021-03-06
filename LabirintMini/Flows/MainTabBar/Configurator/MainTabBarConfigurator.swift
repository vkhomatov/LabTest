//
//  MainTabBarConfigurator.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit

final class MainTabBarConfigurator {

    func configure() -> MainTabBarController {
        let router = MainTabBarRouter()
        let view = MainTabBarController()
        let presenter = MainTabBarPresenter(with: MainTabBar.allCases)

        view.output = presenter
        presenter.view = view
        presenter.router = router
        router.view = view

        return view
    }

}
