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

    typealias Model = ExitButtonCellViewModel
    
    // MARK: - Constants
    
    enum Constants {
        static let redColor =  UIColor(red: 0.902, green: 0.082, blue: 0.169, alpha: 1)
        static let fontSize: CGFloat = 16
    }

    // MARK: - IBOutlets

    @IBOutlet weak var exitButton: UIButton!
    
    // MARK: - Actions

    @IBAction func exitButtonAction(_ sender: UIButton) {
        stateChangeCallback?(.loguot)
    }
    
    // MARK: - Properites
    
    public var stateChangeCallback: ((_ state: LogState) -> Void)?

    // MARK: - System Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Internal Methods
    
    func configure(with model: Model) {
        exitButton.setTitle(model.title, for: .normal)
    }
    
}

// MARK: - Configuration

private extension ExitButtonCell {

    func setupInitialState() {
        
        exitButton.backgroundColor = .clear
        exitButton.titleLabel?.font = .systemFont(ofSize: Constants.fontSize)
        exitButton.setTitleColor(Constants.redColor, for: .normal)
        
        selectionStyle = .none
        separatorInset = UIEdgeInsets(top: .zero, left: .greatestFiniteMagnitude, bottom: .zero, right: .zero)
        
    }

}
