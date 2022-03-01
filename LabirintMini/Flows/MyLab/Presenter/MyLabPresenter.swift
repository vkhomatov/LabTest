//
//  MyLabPresenter.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import Foundation

final class MyLabPresenter {

    // MARK: - Properties

    weak var view: MyLabViewInput?
    var router: MyLabRouterInput?

}

// MARK: - MyLabViewOutput

extension MyLabPresenter: MyLabViewOutput {

    func viewLoaded() { }

}
