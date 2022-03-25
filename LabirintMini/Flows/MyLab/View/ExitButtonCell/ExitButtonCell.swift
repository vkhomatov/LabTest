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

class ExitButtonCell: UITableViewCell, ConfigurableItem {
    
    // MARK: - Typealias

    typealias Model = MyLabCellViewModel
    
    // MARK: - Constants
    
    enum Constants {
        static let redColor =  UIColor(red: 0.902, green: 0.082, blue: 0.169, alpha: 1)
        static let fontSize: CGFloat = 16
    }

    // MARK: - IBOutlets

    @IBOutlet weak var exitButton: UIButton!
    
    // MARK: - Properites
    
    var exitButtonCallback: (() -> Void)?

    // MARK: - System Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
        exitButtonSetup()
    }
    
    // MARK: - Internal Methods
    
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
        exitButton.setTitleColor(Constants.redColor, for: .normal)
    }

}

// MARK: - Actions

private extension ExitButtonCell {

    @IBAction func exitButtonAction(_ sender: UIButton) {
        exitButtonCallback?()
    }

}
