//
//  CodeEnterCell.swift
//  LabirintMini
//
//  Created by homatov on 14.03.2022.
//

import UIKit
import ReactiveDataDisplayManager

internal struct CodeEnterCellViewModel {
    var text: String
    let placeholder: String
}

final class CodeEnterCell: UITableViewCell, ConfigurableItem {
    
    // MARK: - Typealias

    internal typealias Model = CodeEnterCellViewModel
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var codeTextEditView: CodeTextEditView!
        
    // MARK: - Properites

    var editingDidBegin: ((_ text: String) -> Void)?
    var editingDidEnd: ((_ text: String) -> Void)?

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }
    
    // MARK: - Internal
    
    func configure(with model: Model) {
        codeTextEditView.configure(with: model)
    }

}

// MARK: - Configuration

private extension CodeEnterCell {

    func setupInitialState() {
        backgroundColor = ColorAssets.whiteColor.color
        configureCell()
        setCallbaks()
    }
    
    func configureCell() {
        accessoryType = .none
        selectionStyle = .none
        separatorInset = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
        backgroundColor = ColorAssets.whiteColor.color
    }
    
    func setCallbaks() {
        codeTextEditView?.editingDidBegin = { [weak self] text in
            self?.editingDidBegin?(text)
        }
        
        codeTextEditView?.editingDidEnd = { [weak self] text in
            self?.editingDidEnd?(text)
        }
    }

}
