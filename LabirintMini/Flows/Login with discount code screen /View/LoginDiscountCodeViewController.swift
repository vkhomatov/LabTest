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
    @IBOutlet private weak var enterButtonView: EnterButtonView!
    
    // MARK: - NSLayoutConstraint
    
    @IBOutlet private weak var enterButtonViewBottomConstraint: NSLayoutConstraint!

    // MARK: - Properties

    var output: LoginDiscountCodeOutput?
    private let notificationCenter = NotificationCenter.default
    
    // MARK: - Private Properties

    private lazy var adapter = tableView.rddm.manualBuilder
        .build()

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
        setupInitialState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.whitekNavBar(title: L10n.MyLab.discountCodeTitle)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = false
    }

}

// MARK: - LoginDiscountCodeInput

extension LoginDiscountCodeViewController: LoginDiscountCodeInput {
    
    private func setupInitialState() {
        configureView()
        configureTableView()
        configureCells()
        setCallbacks()
        navigationController?.whitekNavBar(title: L10n.MyLab.discountCodeTitle)
        navigationItem.closeBarButtonItem(target: self, action: #selector(closeModule))
        setupKeyboardNotificaition()
    }
    
    func setCodeTextEditErrorState() {
        tableView.separatorColor = ColorAssets.mainRedColor.color
    }
    
    func blockScreen(block: Bool) {
        view.isUserInteractionEnabled = !block
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)

    }
    
}

// MARK: - Private Methods

private extension LoginDiscountCodeViewController {
    
    func configureView() {
        view.backgroundColor = .white
        hideKeyboardWhenViewTapped()
    }
    
    func configureTableView() {
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.keyboardDismissMode = .onDrag
    }
    
    func setupKeyboardNotificaition() {
        notificationCenter.addObserver(self, selector: #selector(keyboardWillBeShown(note:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillBeHidden(note:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func configureCells() {
        let infoTextCellModel = InfoTextCellViewModel(title: L10n.MyLab.discountCodeInfo)
        let infoTextCellGenerator =  BaseNonReusableCellGenerator<InfoTextCell>(with: infoTextCellModel)
        adapter.addCellGenerator(infoTextCellGenerator)
        
        let codeEnterCellModel = CodeEnterCellViewModel(text: "", placeholder: L10n.MyLab.discountCode)
        let codeEnterCellGenerator =  BaseNonReusableCellGenerator<CodeEnterCell>(with: codeEnterCellModel)
        adapter.addCellGenerator(codeEnterCellGenerator)
        
        codeEnterCellGenerator.cell?.editingDidBegin = { [weak self] text in
            self?.output?.editingDidBegin(text)
            self?.tableView.separatorColor = ColorAssets.greyColor.color
        }
        
        codeEnterCellGenerator.cell?.editingDidEnd = { [weak self] text in
            self?.output?.editingDidEnd(text)
        }

        adapter.forceRefill()
    }
    
    func setCallbacks() {
        enterButtonView.touchesEnded = { [weak self]  in
            self?.output?.loginButtonPush()
        }
    }
    
}

// MARK: -  Actions

private extension LoginDiscountCodeViewController {
    
    @objc func closeModule() {
        output?.closeModule()
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
    
}


