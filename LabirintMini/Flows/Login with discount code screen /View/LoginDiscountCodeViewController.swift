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
    let notificationCenter = NotificationCenter.default
    
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
        configureNavBar()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(notificationCenter)
        tabBarController?.tabBar.isHidden = false
    }

}

// MARK: - LabirintViewInput

extension LoginDiscountCodeViewController: LoginDiscountCodeInput {
    
    func setupInitialState() {
        configureView()
        configureTableView()
        configureCells()
        configureNavBar()
        configureBarButtonItem()
        setupKeyboardNotificaition()
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
    
    func configureBarButtonItem() {
        let closeButton = UIButton(type: .custom)
        closeButton.backgroundColor = .clear
        closeButton.setImage(Assets.MyLab.closeButton.image, for: .normal)
        closeButton.frame = CGRect(x: 0, y: 0, width: 19, height: 19)
        closeButton.addTarget(self, action: #selector(closeCodeModule), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: closeButton)
        navigationItem.rightBarButtonItem = barButton
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.title = L10n.MyLab.discountCodeTitle
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
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
        }
        
        codeEnterCellGenerator.cell?.editingDidEnd = { [weak self] text in
            self?.output?.editingDidEnd(text)
        }
        
        adapter.forceRefill()
        
    }
    
}

// MARK: -  @objc Methods

private extension LoginDiscountCodeViewController {
    
    @objc func closeCodeModule() {
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


