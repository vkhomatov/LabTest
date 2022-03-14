//
//  PromoPresenter.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import Foundation

final class PromoPresenter {

    // MARK: - Properties

    weak var view: PromoViewInput?
    var router: PromoRouterInput?

}

// MARK: - PromoViewOutput

extension PromoPresenter: PromoViewOutput {

    func viewLoaded() { }

}
