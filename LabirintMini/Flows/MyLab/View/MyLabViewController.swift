//
//  MyLabViewController.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import UIKit
import ReactiveDataDisplayManager


final class MyLabViewController: UIViewController {
    
    // MARK: - IBOutlet

    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - NSLayoutConstraints

    @IBOutlet weak var blackViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Private Properties

    private lazy var adapter = tableView.rddm.manualBuilder
        .add(plugin: .selectable())
        .build()

    // MARK: - Properties

    var output: MyLabViewOutput?
    var viewBuilder = MyLabViewBuilder()
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
        setupInitialState()
    }
    
}

// MARK: - Private Methods

private extension MyLabViewController {
    
    func setupTableView() {
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.keyboardDismissMode = .onDrag
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 1))
    }
    
}

// MARK: - MyLabViewInput

extension MyLabViewController: MyLabViewInput {

    func setupViewState(with state: LoginState) {
        adapter.clearHeaderGenerators()
        adapter.clearCellGenerators()
        let header = viewBuilder.makeHeader(with: state)
        let cells = viewBuilder.makeCellsContent(with: state)
        adapter.addSectionHeaderGenerator(header)
        adapter.addCellGenerators(cells)
        adapter.forceRefill()
    }
    
    func setBaseCellCallbacks() {
        viewBuilder.didPushCellCallback = { [weak self] cellType in
            switch cellType {
            case .myOrders:
                print(L10n.MyLab.myOrders)
            case .myCoupons:
                print(L10n.MyLab.myCoupons)
            case .myGoods:
                print(L10n.MyLab.purchasedGoods)
            case .mySubscription:
                print(L10n.MyLab.mySubscriptions)
            case .purchasedGoods:
                print(L10n.MyLab.purchasedGoods)
            case .myReviews:
                print(L10n.MyLab.myReviews)
            case .pickupPoints:
                print(L10n.MyLab.pickupPoints)
            case .profileSetting:
                print(L10n.MyLab.profileSettings)
            case .appSetting:
                print(L10n.MyLab.appSettings)
            case .aboutStore:
                print(L10n.MyLab.storeInformation)
            case .delivery:
                print(L10n.MyLab.delivery)
            }
        }

        viewBuilder.exitButtonCallback = { [weak self] in
            self?.output?.exitButtonPush()
        }
        
        viewBuilder.enterButtonCallback = { [weak self] in
            self?.output?.enterButtonPush()
        }
    
    }
    
    func setupInitialState() {
        setupTableView()
        setBaseCellCallbacks()
    }

}
