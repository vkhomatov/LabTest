//
//  LoginDiscountCodeViewController.swift
//  LabirintMini
//
//  Created by homatov on 14.03.2022.
//

import UIKit
import ReactiveDataDisplayManager

final class LoginDiscountCodeViewController: UIViewController {
 
    // MARK: - IBOutlet

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var enterButtonView: EnterButtonView!
    
    // MARK: - Properties

    var output: LoginDiscountCodeOutput?
    
    // MARK: - Private Properties

    private lazy var adapter = tableView.rddm.manualBuilder
        .add(plugin: .displayable())
        .build()

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
        setupInitialState()
    }

}

// MARK: - LabirintViewInput

extension LoginDiscountCodeViewController: LoginDiscountCodeInput {
    
    func setupInitialState() {
        setupTableView()
        setupCells()
        setupNavBar()
    }
    
}

// MARK: - Private Methods

private extension LoginDiscountCodeViewController {
    
    func setupTableView() {
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.keyboardDismissMode = .onDrag
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.barStyle = .default
    }
    
    func setupCells() {
        
        let headerGenerator = HeaderViewGenerator()
        adapter.addSectionHeaderGenerator(headerGenerator)
        if let header = headerGenerator.generate() as? HeaderView {
            header.closeCallback = { [weak self] in
                self?.output?.closeModule()
            }
        }
        
        let infoTextCellModel = InfoTextCellViewModel(title: L10n.MyLab.discountCodeInfo)
        let infoTextCellGenerator =  BaseCellGenerator<InfoTextCell>(with: infoTextCellModel)
        adapter.addCellGenerator(infoTextCellGenerator)
        
        let codeEnterCellModel = CodeEnterCellViewModel(text: "", placeholder: L10n.MyLab.discountCode)
        let codeEnterCellGenerator =  BaseCellGenerator<CodeEnterCell>(with: codeEnterCellModel)
        adapter.addCellGenerator(codeEnterCellGenerator)
        
        adapter.forceRefill()
        
    }
    
}

