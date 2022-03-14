//
//  BasketPresenter.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import Foundation

final class BasketPresenter {

    // MARK: - Properties

    weak var view: BasketViewInput?
    var router: BasketRouterInput?

}

// MARK: - BasketViewOutput

extension BasketPresenter: BasketViewOutput {

    func viewLoaded() { }

}
