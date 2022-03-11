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

        view.viewControllers = [getLabirintTab(), getCatalogTab(), getBasketTab(), getPromoTab(), getMyLabTab()]
        return view
    }

}

private extension MainTabBarConfigurator {

    func makeMainTabBarController() -> MainTabBarScreen {
        let view = MainTabBarScreen()

        view.tabBar.tintColor = .red
        view.tabBar.isTranslucent = false
        view.tabBar.clipsToBounds = true

        return view
    }

    func getLabirintTab() -> UINavigationController {
        let labirintVC = LabirintConfigurator().configure()
        labirintVC.title = L10n.labirint
        let labirintNavigationController = UINavigationController(rootViewController: labirintVC)
        let labirintBarItem = UITabBarItem(title: L10n.labirint,
                                           image: Assets.TabBar.labirintUnactive.image,
                                           selectedImage: Assets.TabBar.labirintActive.image)
        labirintBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        labirintNavigationController.tabBarItem = labirintBarItem
        return labirintNavigationController
    }

    func getCatalogTab() -> UINavigationController {
        let catalogVC = CatalogConfigurator().configure()
        catalogVC.title = L10n.catalog
        let catalogNavigationController = UINavigationController(rootViewController: catalogVC)
        let catalogBarItem = UITabBarItem(title: L10n.catalog,
                                          image: Assets.TabBar.catalogUnactive.image,
                                          selectedImage: Assets.TabBar.catalogActive.image)
        catalogBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        catalogNavigationController.tabBarItem = catalogBarItem
        return catalogNavigationController
    }

    func getBasketTab() -> UINavigationController {
        let basketVC = BasketConfigurator().configure()
        basketVC.title = L10n.basket
        let basketNavigationController = UINavigationController(rootViewController: basketVC)
        let basketBarItem = UITabBarItem(title: L10n.basket,
                                         image: Assets.TabBar.basketUnactive.image,
                                         selectedImage: Assets.TabBar.basketActive.image)
        basketBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        basketNavigationController.tabBarItem = basketBarItem
        return basketNavigationController
    }

    func getPromoTab() -> UINavigationController {
        let promoVC = PromoConfigurator().configure()
        promoVC.title = L10n.promo
        let promoNavigationController = UINavigationController(rootViewController: promoVC)
        let promoBarItem = UITabBarItem(title: L10n.promo,
                                        image: Assets.TabBar.promoUnactive.image,
                                        selectedImage: Assets.TabBar.catalogActive.image)
        promoBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        promoNavigationController.tabBarItem = promoBarItem
        return promoNavigationController
    }

    func getMyLabTab() -> UINavigationController {
        let myLabVC = MyLabConfigurator().configure(state: .loguot)
        myLabVC.title = L10n.myLab
        let myLabNavigationController = UINavigationController(rootViewController: myLabVC)
        let myLabBarItem = UITabBarItem(title: L10n.myLab,
                                        image: Assets.TabBar.mylabUnactive.image,
                                        selectedImage: Assets.TabBar.mylabActive.image)
        myLabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        myLabNavigationController.tabBarItem = myLabBarItem
        return myLabNavigationController        
    }

}
