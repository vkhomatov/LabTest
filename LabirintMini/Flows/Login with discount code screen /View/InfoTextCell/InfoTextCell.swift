//
//  InfoTextCell.swift
//  LabirintMini
//
//  Created by homatov on 14.03.2022.
//

import UIKit
import ReactiveDataDisplayManager

struct InfoTextCellViewModel {
    let title: String
}

class InfoTextCell: UITableViewCell, ConfigurableItem {
    
    // MARK: - Typealias

    typealias Model = InfoTextCellViewModel
    
    // MARK: - Constants
    
    enum Constants {
        static let blackColor: UIColor = .black
        static let whiteColor: UIColor = .white
        static let fontSize: CGFloat = 15
    }
    
    // MARK: - IBOutlets

    @IBOutlet weak var infoTextLabel: UILabel!

    // MARK: - System Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
        configureInfoTextLabel()
    }
    
    // MARK: - Internal Methods

    func configure(with model: Model) {
        infoTextLabel.text = model.title
    }
}

// MARK: - Configuration

private extension InfoTextCell {

    func setupInitialState() {
        selectionStyle = .none
        accessoryType = .none
        separatorInset = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
        backgroundColor = Constants.whiteColor
    }
    
    func configureInfoTextLabel() {
        infoTextLabel.numberOfLines = 2
        infoTextLabel?.font = .systemFont(ofSize: Constants.fontSize)
        infoTextLabel?.textColor = Constants.blackColor
    }

}
