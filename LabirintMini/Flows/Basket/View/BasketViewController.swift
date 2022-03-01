//
//  BasketViewController.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit

final class BasketViewController: UIViewController {

    // MARK: - Properties

    var output: BasketViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - BasketViewInput

extension BasketViewController: BasketViewInput { }
