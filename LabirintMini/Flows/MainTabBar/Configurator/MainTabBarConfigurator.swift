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

    private enum TabNames {
        static let labirint = ("Лабиринт", "TabBar/labirint_unactive", "TabBar/labirint_active")
        static let catalog = ("Каталог", "TabBar/catalog_unactive", "TabBar/catalog_active")
        static let basket = ("Корзина", "TabBar/basket_unactive", "TabBar/basket_active")
        static let promo = ("Акции", "TabBar/promo_unactive", "TabBar/promo_active")
        static let mylab = ("Мой лаб", "TabBar/mylab_unactive", "TabBar/mylab_active")
    }

    func makeMainTabBarController() -> MainTabBarScreen {
        let view = MainTabBarScreen()

        view.tabBar.tintColor = .red
        view.tabBar.isTranslucent = false
        view.tabBar.clipsToBounds = true

        return view
    }

    // swiftlint:disable image_name_initialization

    func getLabirintTab() -> UINavigationController {
        let labirintVC = LabirintConfigurator().configure()
        labirintVC.title = TabNames.labirint.0
        labirintVC.tabBar.isTranslucent = false
        labirintVC.tabBar.clipsToBounds = true
        let labirintNavigationController = UINavigationController(rootViewController: labirintVC)
        let labirintBarItem = UITabBarItem(title: nil,
                                           image: UIImage(named: TabNames.labirint.1),
                                           selectedImage: UIImage(named: TabNames.labirint.2))
        labirintBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        labirintNavigationController.tabBarItem = labirintBarItem
        return labirintNavigationController
    }

    func getCatalogTab() -> UINavigationController {
        let catalogVC = CatalogConfigurator().configure()
        catalogVC.title = TabNames.catalog.0
        let catalogNavigationController = UINavigationController(rootViewController: catalogVC)
        let catalogBarItem = UITabBarItem(title: nil,
                                          image: UIImage(named: TabNames.catalog.1),
                                          selectedImage: UIImage(named: TabNames.catalog.2))
        catalogBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        catalogNavigationController.tabBarItem = catalogBarItem
        return catalogNavigationController
    }

    func getBasketTab() -> UINavigationController {
        let basketVC = BasketConfigurator().configure()
        basketVC.title = TabNames.basket.0
        let basketNavigationController = UINavigationController(rootViewController: basketVC)
        let basketBarItem = UITabBarItem(title: nil,
                                         image: UIImage(named: TabNames.basket.1),
                                         selectedImage: UIImage(named: TabNames.basket.2))
        basketBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        basketNavigationController.tabBarItem = basketBarItem
        return basketNavigationController
    }

    func getPromoTab() -> UINavigationController {
        let promoVC = PromoConfigurator().configure()
        promoVC.title = TabNames.promo.0
        let promoNavigationController = UINavigationController(rootViewController: promoVC)
        let promoBarItem = UITabBarItem(title: nil,
                                        image: UIImage(named: TabNames.promo.1),
                                        selectedImage: UIImage(named: TabNames.promo.2))
        promoBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        promoNavigationController.tabBarItem = promoBarItem
        return promoNavigationController
    }

    func getMyLabTab() -> UINavigationController {
        let myLabVC = MyLabConfigurator().configure()
        myLabVC.title = TabNames.mylab.0
        let myLabNavigationController = UINavigationController(rootViewController: myLabVC)
        let myLabBarItem = UITabBarItem(title: nil,
                                        image: UIImage(named: TabNames.mylab.1),
                                        selectedImage: UIImage(named: TabNames.mylab.2))
        myLabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        myLabNavigationController.tabBarItem = myLabBarItem
        return myLabNavigationController
    }

    // swiftlint:enable image_name_initialization

}
