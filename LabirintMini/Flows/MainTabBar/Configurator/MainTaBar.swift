//
//  MainTaBar.swift
//  LabirintMini
//
//  Created by homatov on 04.03.2022.
//

import UIKit

enum MainTabBar: CaseIterable {

    case labirint
    case catalog
    case basket
    case promo
    case mylab

}

// MARK: - NavigationController

extension MainTabBar {

    func makeController() -> UINavigationController {
        let vc = vc
        vc.title = title
        let navigationController = UINavigationController(rootViewController: vc)
        let barItem = UITabBarItem(title: title,
                                   image: unactiveIcon,
                                   selectedImage: activeIcon)
        barItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        navigationController.tabBarItem = barItem
        navigationController.navigationBar.makeBlackNavBar()

        return navigationController
    }

}

// MARK: - Private Properties

private extension MainTabBar {

    var vc: UIViewController {
        switch self {
        case .labirint:
            return LabirintConfigurator().configure()
        case .catalog:
            return CatalogConfigurator().configure()
        case .basket:
            return BasketConfigurator().configure()
        case .promo:
            return PromoConfigurator().configure()
        case .mylab:
            return MyLabConfigurator().configure()
        }
    }

    var title: String {
        switch self {
        case .labirint:
            return L10n.TabBar.labirint
        case .catalog:
            return L10n.TabBar.catalog
        case .basket:
            return L10n.TabBar.basket
        case .promo:
            return L10n.TabBar.promo
        case .mylab:
            return L10n.TabBar.mylab
        }
    }

    var activeIcon: UIImage {
        switch self {
        case .labirint:
            return Assets.TabBar.labirintActive.image
        case .catalog:
            return Assets.TabBar.catalogActive.image
        case .basket:
            return Assets.TabBar.basketActive.image
        case .promo:
            return Assets.TabBar.promoActive.image
        case .mylab:
            return Assets.TabBar.mylabActive.image
        }
    }

    var unactiveIcon: UIImage {
        switch self {
        case .labirint:
            return Assets.TabBar.labirintUnactive.image
        case .catalog:
            return Assets.TabBar.catalogUnactive.image
        case .basket:
            return Assets.TabBar.basketUnactive.image
        case .promo:
            return Assets.TabBar.promoUnactive.image
        case .mylab:
            return Assets.TabBar.mylabUnactive.image
        }
    }

}
