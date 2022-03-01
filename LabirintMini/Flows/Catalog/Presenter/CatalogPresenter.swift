//
//  CatalogPresenter.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit

final class CatalogPresenter {

    // MARK: - Properties

    weak var view: CatalogViewInput?
    var router: CatalogRouterInput?

}

// MARK: - CatalogViewOutput

extension CatalogPresenter: CatalogViewOutput {

    func viewLoaded() { }

}
