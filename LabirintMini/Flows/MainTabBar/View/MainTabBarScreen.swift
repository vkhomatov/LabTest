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
        output?.viewLoaded()
    }

}

// MARK: - MainTabBarScreenInput

extension MainTabBarScreen: MainTabBarScreenInput { }
