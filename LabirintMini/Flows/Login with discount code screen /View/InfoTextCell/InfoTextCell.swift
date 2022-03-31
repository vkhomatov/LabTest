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

final class InfoTextCell: UITableViewCell, ConfigurableItem {
    
    // MARK: - Typealias

    internal typealias Model = InfoTextCellViewModel
    
    // MARK: - Constants
    
    enum Constants {
        static let fontSize: CGFloat = 15
    }
    
    // MARK: - IBOutlets

    @IBOutlet private weak var infoTextLabel: UILabel!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }
    
    // MARK: - Internal

    func configure(with model: Model) {
        infoTextLabel.text = model.title
    }

}

// MARK: - Configuration

private extension InfoTextCell {

    func setupInitialState() {
        configureCell()
        configureInfoTextLabel()
    }
    
    func configureCell() {
        selectionStyle = .none
        accessoryType = .none
        separatorInset = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
        backgroundColor = ColorAssets.whiteColor.color
    }
    
    func configureInfoTextLabel() {
        infoTextLabel.numberOfLines = 2
        infoTextLabel?.font = .systemFont(ofSize: Constants.fontSize)
        infoTextLabel?.textColor = ColorAssets.blackColor.color
    }

}
