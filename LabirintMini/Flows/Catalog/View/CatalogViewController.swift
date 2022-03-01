//
//  CatalogViewController.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit

final class CatalogViewController: UIViewController {

    // MARK: - Properties

    var output: CatalogViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

}

// MARK: - CatalogViewInput

extension CatalogViewController: CatalogViewInput { }
