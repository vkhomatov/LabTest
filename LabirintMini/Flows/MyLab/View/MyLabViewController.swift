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
        view.addSubview(tableView)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.barStyle = .black
    }
    
}

// MARK: - MyLabViewInput

extension MyLabViewController: MyLabViewInput {

    func setupViewState(_ model: MyLabViewModel) {
        adapter.clearHeaderGenerators()
        adapter.clearCellGenerators()
        
        switch model.state {
        
        case .login:
            
            adapter.addSectionHeaderGenerator(model.makeHeader(with: .loginHeader))
            adapter.addCellGenerator(model.makeStandartRow(with: .myOrders))
            adapter.addCellGenerator(model.makeStandartRow(with: .myCoupons))
            adapter.addCellGenerator(model.makeStandartRow(with: .savingGoods))
            adapter.addCellGenerator(model.makeStandartRow(with: .mySubscription))
            adapter.addCellGenerator(model.makeStandartRow(with: .purchasedGoods))
            adapter.addCellGenerator(model.makeStandartRow(with: .myReviews))
            adapter.addCellGenerator(model.makeDeliveryRow(model.state))
            adapter.addCellGenerator(model.makeStandartRow(with: .pickupPoints))
            adapter.addCellGenerator(model.makeStandartRow(with: .profileSetting))
            adapter.addCellGenerator(model.makeStandartRow(with: .appSetting))
            adapter.addCellGenerator(model.makeStandartRow(with: .aboutStore))
            
            let logoutGenerator = model.makeExitRow()
            adapter.addCellGenerator(logoutGenerator)
            logoutGenerator.cell?.stateChangeCallback = { [weak self] state in
                self?.output?.changeState(state)
            }
            
        case .loguot:
            
            let headerGenerator = model.makeHeader(with: .logoutHeader)
            adapter.addSectionHeaderGenerator(headerGenerator)
            if let header = headerGenerator.generate() as? UnautorizedHeaderView {
                header.stateChangeCallback = { [weak self] state in
                    let vc = LoginDiscountCodeConfigurator().configure()
                    //self?.navigationController?.pushViewController(vc, animated: true)
                    self?.present(vc, animated: true, completion: nil)
                    //self?.output?.changeState(state)
                }
            }
            
            adapter.addCellGenerator(model.makeDeliveryRow(model.state))
            adapter.addCellGenerator(model.makeStandartRow(with: .appSetting))
            adapter.addCellGenerator(model.makeStandartRow(with: .aboutStore))
            
        }

        adapter.forceRefill()

    }
    
    func setupInitialState() {
        setupTableView()
        setupNavBar()
        // заглушка, которая не очень работает
        blackViewHeightConstraint.constant = tableView.frame.height / 3
    }

}
