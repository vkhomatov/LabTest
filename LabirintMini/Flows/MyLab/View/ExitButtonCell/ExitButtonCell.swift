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
        static let redColor = UIColor(red: 0.878, green: 0.376, blue: 0.376, alpha: 1)
    }

    // MARK: - IBOutlets

    @IBOutlet weak var exitButton: UIButton!
    
    // MARK: - Actions

    @IBAction func exitButtonAction(_ sender: UIButton) {
    }
    
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
        exitButton.titleLabel?.text = model.title
    }
    
}

// MARK: - Configuration

private extension ExitButtonCell {

    func setupInitialState() {
        
        exitButton.backgroundColor = .clear
        exitButton.titleLabel?.font = .systemFont(ofSize: 16)
        exitButton.titleLabel?.textColor = Constants.redColor

        self.selectionStyle = .gray
        self.separatorInset = UIEdgeInsets(top: 0, left: 200, bottom: 0, right: 0)
    }

}
