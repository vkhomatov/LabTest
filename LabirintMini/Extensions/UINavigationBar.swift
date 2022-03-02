//
//  UINavigationBar.swift
//  LabirintMini
//
//  Created by homatov on 02.03.2022.
//

import UIKit

extension UINavigationBar {

    func makeBlackNavBar() {
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
    }

}
