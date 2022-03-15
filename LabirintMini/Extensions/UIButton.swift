//
//  UIButton.swift
//  LabirintMini
//
//  Created by homatov on 11.03.2022.
//

import UIKit

extension UIButton {
    
    enum Constants {
        static let blueColor = UIColor(red: 0.024, green: 0.314, blue: 0.761, alpha: 1)
        static let sirenColor = UIColor(red: 0.024, green: 0.314, blue: 0.761, alpha: 1)
        static let whiteColor: UIColor = .white
        static let fontSize: CGFloat = 16
        static let cornerRadius: CGFloat = 6
    }
    
    func loginButton(title: String)  {
        layer.masksToBounds = true
        layer.cornerRadius = Constants.cornerRadius
        backgroundColor = Constants.whiteColor
        titleLabel?.font = .systemFont(ofSize: Constants.fontSize)
        setTitleColor(Constants.blueColor, for: .normal)
        setTitle(title, for: .normal)
    }
    
    func enterCodeButton(title: String)  {
        layer.masksToBounds = true
        layer.cornerRadius = Constants.cornerRadius
        backgroundColor = Constants.blueColor
        titleLabel?.font = .systemFont(ofSize: Constants.fontSize)
        setTitleColor(Constants.whiteColor, for: .normal)
        setTitle(title, for: .normal)
    }

}

