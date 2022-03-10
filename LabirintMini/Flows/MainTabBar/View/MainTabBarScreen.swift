//
//  MainTabBarScreen.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit

class MainTabBarScreen: UITabBarController {

    // MARK: - Properties

    var output: MainTabBarScreenOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        output?.viewLoaded()
    }

}

// MARK: - MainTabBarScreenInput

extension MainTabBarScreen: MainTabBarScreenInput {
    
    func configure(with tabs: [MainTabBar]) {
        viewControllers = tabs.map { $0.makeController() }
    }
    
}

private extension MainTabBarScreen {
    
    func setupInitialState() {
        tabBar.tintColor = .red
        tabBar.isTranslucent = false
        tabBar.clipsToBounds = true
    }
    
}
