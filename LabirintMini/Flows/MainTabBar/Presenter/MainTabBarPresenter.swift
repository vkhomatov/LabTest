//
//  MainTabBarPresenter.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import Foundation

final class MainTabBarPresenter {

    // MARK: - Properties

    weak var view: MainTabBarControllerInput?
    var router: MainTabBarRouterInput?
    private var tabs: [MainTabBar]

    // MARK: - Init
    
    init(with tabs: [MainTabBar]) {
        self.tabs = tabs
    }

}

// MARK: - MainTabBarViewOutput

extension MainTabBarPresenter: MainTabBarControllerOutput {

    func viewLoaded() {
        view?.configure(with: tabs)
    }

}
