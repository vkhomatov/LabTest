//
//  ExitButtonCell.swift
//  LabirintMini
//
//  Created by homatov on 05.03.2022.
//

import UIKit
import ReactiveDataDisplayManager

struct ExitButtonCellViewModel {
    let title: String
}

final class ExitButtonCell: UITableViewCell, ConfigurableItem {
    
    // MARK: - Typealias

    internal typealias Model = MyLabCellViewModel
    
    // MARK: - Constants
    
    private enum Constants {
        static let fontSize: CGFloat = 16
    }

    // MARK: - IBOutlets

    @IBOutlet private weak var exitButton: UIButton!
    
    // MARK: - Properites
    
    var exitButtonCallback: (() -> Void)?

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
        exitButtonSetup()
    }
    
    // MARK: - Internal
    
    func configure(with model: Model) {
        exitButton.setTitle(model.title, for: .normal)
    }
    
}

// MARK: - Configuration

private extension ExitButtonCell {

    func setupInitialState() {
        selectionStyle = .none
        separatorInset = UIEdgeInsets(top: .zero, left: 400, bottom: .zero, right: .zero)
    }
    
    func exitButtonSetup() {
        exitButton.backgroundColor = .clear
        exitButton.titleLabel?.font = .systemFont(ofSize: Constants.fontSize)
        exitButton.setTitleColor(ColorAssets.mainRedColor.color, for: .normal)
    }

}

// MARK: - Actions

private extension ExitButtonCell {

    @IBAction func exitButtonAction(_ sender: UIButton) {
        exitButtonCallback?()
    }

}
