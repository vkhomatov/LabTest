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
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 1))
    }
    
}

// MARK: - MyLabViewInput

extension MyLabViewController: MyLabViewInput {

    func setupViewState(with state: LoginState) {
        adapter.clearHeaderGenerators()
        adapter.clearCellGenerators()
        
        let headerGenerator = MyLabViewModelBuilder(with: state).makeHeader()
        let cells = MyLabViewModelBuilder(with: state).makeCellsGenerators()
        
        if let header = headerGenerator.generate() as? UnautorizedHeaderView {
            header.enterButtonCallback = { [weak self] in
                self?.output?.changeState(with: .login())
            }
        }
        
        if cells.last?.identifier == "ExitButtonCell" {
            if let logoutGenerator = cells.last as? BaseNonReusableCellGenerator<ExitButtonCell>   {
                logoutGenerator.cell?.exiButtonCallback = { [weak self] in
                    self?.output?.changeState(with: .logout())
                }
            }
        }
       
        adapter.addSectionHeaderGenerator(headerGenerator)
        adapter.addCellGenerators(cells)
        adapter.forceRefill()
    }
    
    func setupInitialState() {
        setupTableView()
    }

}
