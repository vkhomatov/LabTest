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
        static let blueColor = UIColor(red: 0.024, green: 0.314, blue: 0.761, alpha: 1)
        static let sirenColor = UIColor(red: 0.024, green: 0.314, blue: 0.761, alpha: 1)
        static let whiteColor: UIColor = .white
        static let fontSize: CGFloat = 16
        static let cornerRadius: CGFloat = 6
    }
    
    func setStyle(_ style: ButtonStyle) {
    
        switch style {
        case .login(let title):
            setTitle(title, for: .normal)
            backgroundColor = Constants.whiteColor
            setTitleColor(Constants.blueColor, for: .normal)
        case .enterCode(let title):
            setTitle(title, for: .normal)
            backgroundColor = Constants.blueColor
            setTitleColor(Constants.whiteColor, for: .normal)
        }
        
        layer.masksToBounds = true
        layer.cornerRadius = Constants.cornerRadius
        titleLabel?.font = .systemFont(ofSize: Constants.fontSize)
    }

}

