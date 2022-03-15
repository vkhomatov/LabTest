//
//  UIViewController.swift
//  LabirintMini
//
//  Created by homatov on 15.03.2022.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenViewTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
