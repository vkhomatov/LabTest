//
//  UINavigationItem.swift
//  LabirintMini
//
//  Created by homatov on 30.03.2022.
//

import UIKit

extension UINavigationItem {

    // устанавливает BarButtonItem close синим крестиком
    func closeBarButtonItem(target: Any, action: Selector) {
        let closeButton = UIButton(type: .custom)
        closeButton.backgroundColor = .clear
        closeButton.setImage(Assets.MyLab.closeButton.image, for: .normal)
        closeButton.frame = CGRect(x: 0, y: 0, width: 19, height: 19)
        closeButton.addTarget(target, action: action, for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: closeButton)
        self.rightBarButtonItem = barButton
    }

}
