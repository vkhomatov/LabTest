//
//  CodeEnterCell.swift
//  LabirintMini
//
//  Created by homatov on 14.03.2022.
//

import UIKit
import ReactiveDataDisplayManager

enum CodeTextEditState {
    case yesText
    case noText
}

struct CodeEnterCellViewModel {
    var text: String
    let placeholder: String
}

class CodeEnterCell: UITableViewCell, ConfigurableItem {
    
    // MARK: - Typealias

    typealias Model = CodeEnterCellViewModel
    
    // MARK: - Constants
    
    enum Constants {
        static let blackColor: UIColor = .black
        static let whiteColor: UIColor = .white
        static let fontSize: CGFloat = 17
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var codeTextField: UITextField!


    // MARK: - IBActions

    @IBAction private func codeTextFieldEditingChange(_ sender: UITextField) {
    }

    @IBAction private func codeTextFieldEditingDidBegin(_ sender: UITextField) {
    }

    @IBAction private func codeTextFieldValueChanged(_ sender: UITextField) {
    }
    
    // MARK: - System Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }
    
    // MARK: - Internal Methods
    
    func configure(with model: Model) {
        codeTextField.placeholder = model.placeholder
        codeTextField.text = model.text
    }

}


// MARK: - Configuration

private extension CodeEnterCell {

    func setupInitialState() {
        codeTextField.font = .systemFont(ofSize: Constants.fontSize)
        codeTextField.textColor = Constants.blackColor
        
        accessoryType = .none
        selectionStyle = .none
        separatorInset = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
        backgroundColor = Constants.whiteColor
    }
    
    func changeState(state: CodeTextEditState) {
        
    }

}
