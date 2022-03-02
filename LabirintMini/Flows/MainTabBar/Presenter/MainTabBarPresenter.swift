//
//  MainTabBarPresenter.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import Foundation

final class MainTabBarPresenter {

    // MARK: - Properties

    weak var view: MainTabBarScreenInput?
    var router: MainTabBarRouterInput?

}

// MARK: - MainTabBarViewOutput

extension MainTabBarPresenter: MainTabBarScreenOutput {

    func viewLoaded() { }

}
