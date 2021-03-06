//
//  LabirintViewController.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit

final class LabirintViewController: UIViewController {

    // MARK: - Properties

    var output: LabirintViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
        configureView()
    }

}

// MARK: - LabirintViewInput

extension LabirintViewController: LabirintViewInput { }

// MARK: - Private Methods

private extension LabirintViewController {

    private func configureView() {
        view.backgroundColor = .white
    }

}
