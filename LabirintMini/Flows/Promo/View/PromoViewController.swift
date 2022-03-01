//
//  PromoViewController.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit

final class PromoViewController: UIViewController {

    // MARK: - Properties

    var output: PromoViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - PromoViewInput

extension PromoViewController: PromoViewInput { }
