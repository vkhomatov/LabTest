//
//  UIButton.swift
//  LabirintMini
//
//  Created by homatov on 11.03.2022.
//

import UIKit

enum ButtonStyle {
    case login(title: String)
    case enterCode(title: String)
}

extension UIButton {
    
    enum Constants {
        static let fontSize: CGFloat = 16
        static let cornerRadius: CGFloat = 6
    }
    
    func setStyle(_ style: ButtonStyle) {
    
        switch style {
        case .login(let title):
            setTitle(title, for: .normal)
            backgroundColor = ColorAssets.whiteColor.color
            setTitleColor(ColorAssets.blueColor.color, for: .normal)
        case .enterCode(let title):
            setTitle(title, for: .normal)
            backgroundColor = ColorAssets.blueColor.color
            setTitleColor(ColorAssets.whiteColor.color, for: .normal)
        }
        
        layer.masksToBounds = true
        layer.cornerRadius = Constants.cornerRadius
        titleLabel?.font = .systemFont(ofSize: Constants.fontSize)
    }

}

