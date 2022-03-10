//
//  StandartReusableCell.swift
//  LabirintMini
//
//  Created by homatov on 05.03.2022.
//

import UIKit
import ReactiveDataDisplayManager

// MARK: - CellViewModel

struct StandartReusableCellViewModel {
    let title: String
    let value: String?
    let valueTextColor: UIColor?
}

// MARK: - CellClass

class StandartReusableCell: UITableViewCell, ConfigurableItem {

    // MARK: - Typealias

    typealias Model = StandartReusableCellViewModel

    // MARK: - Constants
    
    enum Constants {
        static let greyColor = UIColor(red: 0.616, green: 0.616, blue: 0.616, alpha: 1)
        static let redColor = UIColor(red: 0.878, green: 0.376, blue: 0.376, alpha: 1)
    }
    
    // MARK: - IBOutlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
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
        titleLabel.text = model.title
        valueLabel.text = model.value
        valueLabel.textColor = model.valueTextColor
    }

}

// MARK: - Configuration

private extension StandartReusableCell {

    func setupInitialState() {
        titleLabel.numberOfLines = 1
        titleLabel.backgroundColor = .clear
        titleLabel?.font = .systemFont(ofSize: 17)
        titleLabel?.textColor = .black

        valueLabel.numberOfLines = 1
        valueLabel.backgroundColor = .clear
        valueLabel?.font = .systemFont(ofSize: 14)
        valueLabel?.textColor = Constants.redColor

        self.selectionStyle = .gray
        self.accessoryType = .disclosureIndicator
    }

}

