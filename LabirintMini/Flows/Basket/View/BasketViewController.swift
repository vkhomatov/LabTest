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
        configureView()
    }

}

// MARK: - BasketViewInput

extension BasketViewController: BasketViewInput { }

// MARK: - Private Methods

private extension BasketViewController {

    private func configureView() {
        view.backgroundColor = .white
    }

}
