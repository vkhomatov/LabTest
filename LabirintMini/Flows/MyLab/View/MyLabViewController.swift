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

    @IBOutlet private weak var blackViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Private Properties

    private lazy var adapter = tableView.rddm.manualBuilder
        .build()

    // MARK: - Properties

    var output: MyLabViewOutput?
    private var viewBuilder = MyLabViewBuilder()
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
        setupInitialState()
    }
    
}

// MARK: - Private Methods

private extension MyLabViewController {
    
    func configureTableView() {
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.keyboardDismissMode = .onDrag
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 1))
    }
    
    func setBaseCellCallbacks() {
        viewBuilder.didPushCellCallback = { [weak self] cellType in
            self?.output?.cellPressed(of: cellType)
        }
        viewBuilder.exitButtonCallback = { [weak self] in
            self?.output?.exitButtonPush()
        }
        viewBuilder.enterButtonCallback = { [weak self] in
            self?.output?.enterButtonPush()
        }
    }
    
}

// MARK: - MyLabViewInput

extension MyLabViewController: MyLabViewInput {
    
    func setupInitialState() {
        configureTableView()
        setBaseCellCallbacks()
    }
    
    func configureViewState(with state: LoginState) {
        adapter.clearHeaderGenerators()
        adapter.clearCellGenerators()
        let header = viewBuilder.makeHeaderGenerator(with: state)
        let cells = viewBuilder.makeCellsContent(with: state)
        adapter.addSectionHeaderGenerator(header)
        adapter.addCellGenerators(cells)
        adapter.forceRefill()
    }
    
}
