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

extension MainTabBar {

    func makeController() -> UINavigationController {
        // swiftlint:disable image_name_initialization

        let vc = vc
        vc.title = title
        let navigationController = UINavigationController(rootViewController: vc)
        let barItem = UITabBarItem(title: nil,
                                   image: UIImage(named: unactiveIcon),
                                   selectedImage: UIImage(named: activeIcon))
        barItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        navigationController.tabBarItem = barItem
        navigationController.navigationBar.makeBlackNavBar()

        return navigationController

        // swiftlint:enable image_name_initialization
    }

}

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
            return "Лабиринт"
        case .catalog:
            return "Каталог"
        case .basket:
            return "Корзина"
        case .promo:
            return "Акции"
        case .mylab:
            return "Мой лаб"
        }
    }

    var activeIcon: String {
        switch self {
        case .labirint:
            return "TabBar/labirint_active"
        case .catalog:
            return "TabBar/catalog_active"
        case .basket:
            return "TabBar/basket_active"
        case .promo:
            return "TabBar/promo_active"
        case .mylab:
            return "TabBar/mylab_active"
        }
    }

    var unactiveIcon: String {
        switch self {
        case .labirint:
            return "TabBar/labirint_unactive"
        case .catalog:
            return "TabBar/catalog_unactive"
        case .basket:
            return "TabBar/basket_unactive"
        case .promo:
            return "TabBar/promo_unactive"
        case .mylab:
            return "TabBar/mylab_unactive"
        }
    }

}
