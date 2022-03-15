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
    
    // MARK: - NSLayoutConstraint
    
    @IBOutlet weak var enterButtonViewBottomConstraint: NSLayoutConstraint!

    // MARK: - Properties

    var output: LoginDiscountCodeOutput?
    let center = NotificationCenter.default
    
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
    
    deinit {
        NotificationCenter.default.removeObserver(center)
    }

}

// MARK: - LabirintViewInput

extension LoginDiscountCodeViewController: LoginDiscountCodeInput {
    
    func setupInitialState() {
        setupView()
        setupTableView()
        setupCells()
        setupNavBar()
        setupKeyboardNotificaition()
    }
    
}

// MARK: - Private Methods

private extension LoginDiscountCodeViewController {
    
    func setupView() {
        view.backgroundColor = .white
        self.hideKeyboardWhenViewTapped()
    }
    
    func setupTableView() {
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.keyboardDismissMode = .onDrag
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.barStyle = .default
    }
    
    func setupKeyboardNotificaition() {
        center.addObserver(self, selector: #selector(keyboardWillBeShown(note:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillBeHidden(note:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillBeShown(note: Notification) {
        let userInfo = note.userInfo
        guard let keyboardFrame = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
            self?.enterButtonViewBottomConstraint.constant = keyboardFrame.height
            self?.view.layoutIfNeeded()
        })
    }
    
    @objc func keyboardWillBeHidden(note: Notification) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
            self?.enterButtonViewBottomConstraint.constant = .zero
            self?.view.layoutIfNeeded()
        })
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

