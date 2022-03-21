//
//  StandartReusableCell.swift
//  LabirintMini
//
//  Created by homatov on 05.03.2022.
//

import UIKit
import ReactiveDataDisplayManager

// MARK: - CellViewModel

struct CellViewModel {
    let title: String
    var value: String? = nil
    var valueTextColor: UIColor? = UIColor(red: 0.878, green: 0.376, blue: 0.376, alpha: 1)
    var state: LoginState? = .logout()
}

// MARK: - CellClass

class StandartReusableCell: UITableViewCell, ConfigurableItem {
    
    // MARK: - Typealias

    typealias Model = CellViewModel

    // MARK: - Constants
    
    enum Constants {
        static let greyColor = UIColor(red: 0.616, green: 0.616, blue: 0.616, alpha: 1)
        static let redColor = UIColor(red: 0.878, green: 0.376, blue: 0.376, alpha: 1)
        static let blackColor: UIColor = .black
        static let whiteColor: UIColor = .white
        static let bigFont: CGFloat = 17
        static let smallFont: CGFloat = 14
        static let rowHeight: CGFloat = 65
        static let cornerRadius: CGFloat = 6
    }
    
    // MARK: - IBOutlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: - System Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

    override func prepareForReuse() {
        layer.cornerRadius = .zero
        layer.masksToBounds = false
        valueLabel?.textColor = Constants.redColor

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Internal Methods

    func configure(with model: Model) {
        titleLabel.text = model.title
        valueLabel.text = model.value 
        valueLabel.textColor = model.valueTextColor

        if model.title == L10n.MyLab.myOrders {
            layer.masksToBounds = true
            layer.cornerRadius = Constants.cornerRadius
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
    }
    
    static func getHeight(forWidth width: CGFloat, with model: CellViewModel) -> CGFloat {
        return Constants.rowHeight
    }

}

// MARK: - Configuration

private extension StandartReusableCell {

    func setupInitialState() {        
        titleLabel.numberOfLines = 1
        titleLabel?.font = .systemFont(ofSize: Constants.bigFont)
        titleLabel?.textColor = Constants.blackColor

        valueLabel.numberOfLines = 1
        valueLabel?.font = .systemFont(ofSize: Constants.smallFont)
        valueLabel?.textColor = Constants.redColor

        selectionStyle = .gray
        accessoryType = .disclosureIndicator
        separatorInset = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
        backgroundColor = Constants.whiteColor
    }

}

