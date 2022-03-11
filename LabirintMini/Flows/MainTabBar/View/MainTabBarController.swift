//
//  MainTabBarController.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    // MARK: - Properties

    var output: MainTabBarControllerOutput?

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

extension MainTabBarController: MainTabBarControllerInput {
    
    func configure(with tabs: [MainTabBar]) {
        viewControllers = tabs.map { $0.makeController() }
    }
    
}

private extension MainTabBarController {
    
    func setupInitialState() {
        tabBar.tintColor = .red
        tabBar.isTranslucent = false
        tabBar.clipsToBounds = true
    }
    
}
