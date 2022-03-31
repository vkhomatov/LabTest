//
//  UIViewController.swift
//  LabirintMini
//
//  Created by homatov on 15.03.2022.
//

import UIKit

extension UIViewController {
    
    // устанавливает распознователь жестов тап на view
    func hideKeyboardWhenViewTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // скрывает клавиатуру по тапу на view
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }

}
