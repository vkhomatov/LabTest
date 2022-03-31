//
//  UINavigationController.swift
//  LabirintMini
//
//  Created by homatov on 30.03.2022.
//

import UIKit

extension UINavigationController {
    
    // устанавливает белый навигейшн бар с размером шрифта тайтла 17 и скрытой кнопкой назад
    func whitekNavBar(title: String) {
        self.navigationBar.barStyle = .default
        self.navigationBar.barTintColor = .white
        self.navigationBar.isTranslucent = false
        self.navigationBar.shadowImage = UIImage()
        self.navigationItem.title = title
        self.navigationItem.hidesBackButton = true
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
    }

}
