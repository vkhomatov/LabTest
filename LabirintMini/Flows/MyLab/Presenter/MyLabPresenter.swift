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
    var viewModel: MyLabViewModel
    
    // MARK: - Initialization

    init(state: LogState) {
        self.viewModel = MyLabViewModel(state)
    }

}

// MARK: - MyLabViewOutput

extension MyLabPresenter: MyLabViewOutput {
    
    func viewLoaded() {
        view?.setupViewState(viewModel)
    }
    
    func changeState(_ state: LogState) {
        view?.setupViewState(MyLabViewModel(state))
    }

}
