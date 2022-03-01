//
//  MyLabViewController.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit

final class MyLabViewController: UIViewController {

    // MARK: - Properties

    var output: MyLabViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - MyLabViewInput

extension MyLabViewController: MyLabViewInput { }
