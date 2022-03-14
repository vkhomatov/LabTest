//
//  LabirintPresenter.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit

final class LabirintPresenter {

    // MARK: - Properties

    weak var view: LabirintViewInput?
    var router: LabirintRouterInput?

}

// MARK: - LabirintViewOutput

extension LabirintPresenter: LabirintViewOutput {

    func viewLoaded() { }

}
