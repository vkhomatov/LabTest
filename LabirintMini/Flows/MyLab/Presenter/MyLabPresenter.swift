//
//  MyLabPresenter.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit

final class MyLabPresenter {
    
    // MARK: - Constants
    
    enum Constants {
        static let greyColor = UIColor(red: 0.616, green: 0.616, blue: 0.616, alpha: 1)
        static let redColor = UIColor(red: 0.878, green: 0.376, blue: 0.376, alpha: 1)
    }

    // MARK: - Properties

    weak var view: MyLabViewInput?
    var router: MyLabRouterInput?
    private var state: LoginState
    private var cellModels = [CellViewModel]()
    private var headerModel: MyLabAutorizedHeaderDataModel?
    private var headerServerModel = MyLabAutorizedHeaderDataModel()
    private var serverMyLabDataModel = MyLabCellsDataModel()
    
    // MARK: - Initialization

    init(state: LoginState) {
        self.state = state
    }

}

// MARK: - MyLabViewOutput

extension MyLabPresenter: MyLabViewOutput {
    
    func viewLoaded() {
        setModel(state: state,
                      headerServerModel: headerServerModel,
                      cellsServerModel: serverMyLabDataModel)
        view?.setupViewState(with: state)
    }
    
    func changeState(with state: LoginState) {
        self.state = state
        setModel(state: state,
                      headerServerModel: headerServerModel,
                      cellsServerModel: serverMyLabDataModel)
        view?.setupViewState(with: self.state)
    }

}

private extension MyLabPresenter {

    func setModel(state: LoginState,
                  headerServerModel: MyLabAutorizedHeaderDataModel,
                  cellsServerModel: MyLabCellsDataModel)
    {
        switch state {
        case .login(_, _):
            self.headerModel = headerServerModel
            self.cellModels = [CellViewModel(title: L10n.MyLab.myOrders, value: String(cellsServerModel.myOrders) + L10n.MyLab.inProcessing),
                               CellViewModel(title: L10n.MyLab.myCoupons + " " + String(cellsServerModel.myCoupons), value: String(cellsServerModel.couponsOnFire) + L10n.MyLab.inFire),
                               CellViewModel(title: L10n.MyLab.savingGoods, value: String(cellsServerModel.myGoods), valueTextColor: Constants.greyColor),
                               CellViewModel(title: L10n.MyLab.mySubscriptions, value: String(cellsServerModel.mySubscriptions) + L10n.MyLab.updates),
                               CellViewModel(title: L10n.MyLab.purchasedGoods),
                               CellViewModel(title: L10n.MyLab.myReviews),
                               CellViewModel(title: L10n.MyLab.delivery, value: String(cellsServerModel.delivryAddress), state: state),
                               CellViewModel(title: String(cellsServerModel.pickupPoints) + L10n.MyLab.pickupPoints),
                               CellViewModel(title: L10n.MyLab.profileSettings),
                               CellViewModel(title: L10n.MyLab.appSettings),
                               CellViewModel(title: L10n.MyLab.storeInformation),
                               CellViewModel(title: L10n.MyLab.logout)]
            self.state = .login(headerModel: headerModel!, cellModels: cellModels)
        case .logout(_):
            self.cellModels = [CellViewModel(title: L10n.MyLab.delivery, value: String(cellsServerModel.delivryAddress), state: state),
                               CellViewModel(title: L10n.MyLab.appSettings),
                               CellViewModel(title: L10n.MyLab.storeInformation)]
            self.state = .logout(cellModels: cellModels)
        }
    }

}
