//
//  MainTabBarConfigurator.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit

final class MainTabBarConfigurator {

    func configure() -> MainTabBarScreen {
        let presenter = MainTabBarPresenter()
        let router = MainTabBarRouter()
        let view = makeMainTabBarController()

        view.output = presenter
        presenter.view = view
        presenter.router = router
        router.view = view

        return view
    }

}

private extension MainTabBarConfigurator {

    func makeMainTabBarController() -> MainTabBarScreen {
        let view = MainTabBarScreen()

        view.tabBar.tintColor = .red
        view.tabBar.isTranslucent = false
        view.tabBar.clipsToBounds = true
    
        view.viewControllers = [
            MainTabBar.labirint.makeController(),
            MainTabBar.catalog.makeController(),
            MainTabBar.basket.makeController(),
            MainTabBar.promo.makeController(),
            MainTabBar.mylab.makeController()
        ]

        return view
    }

}
