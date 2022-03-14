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
        configureView()
    }

}

// MARK: - CatalogViewInput

extension CatalogViewController: CatalogViewInput { }

// MARK: - Private Methods

private extension CatalogViewController {

    private func configureView() {
        view.backgroundColor = .white
    }

}
