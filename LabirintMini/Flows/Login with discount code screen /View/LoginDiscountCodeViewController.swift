//
//  LoginDiscountCodeViewController.swift
//  LabirintMini
//
//  Created by homatov on 14.03.2022.
//

import UIKit

final class LoginDiscountCodeViewController: UIViewController {
 
    // MARK: - Properties

    var output: LoginDiscountCodeOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - LabirintViewInput

extension LoginDiscountCodeViewController: LoginDiscountCodeInput { }
