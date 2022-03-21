//
//  DeliveryAddressCell.swift
//  LabirintMini
//
//  Created by homatov on 05.03.2022.
//

import UIKit
import ReactiveDataDisplayManager


// MARK: - CellViewModel

class DeliveryAddressCell: UITableViewCell, ConfigurableItem {

    // MARK: - Typealias

    typealias Model = CellViewModel
    
    // MARK: - Constants
    
    enum Constants {
        static let greyColor = UIColor(red: 0.616, green: 0.616, blue: 0.616, alpha: 1)
        static let blackColor: UIColor = .black
        static let whiteColor: UIColor = .white
        static let bigFont: CGFloat = 17
        static let smallFont: CGFloat = 13
        static let cornerRadius: CGFloat = 6
    }
    
    // MARK: - IBOutlets

    @IBOutlet weak var deliveryTitleLabel: UILabel!
    @IBOutlet weak var deliveryAddressLabel: UILabel!
    
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
        deliveryTitleLabel.text = model.title
        deliveryAddressLabel.text = model.value
        
        switch model.state {
        case .logout(_):
            layer.masksToBounds = true
            layer.cornerRadius = Constants.cornerRadius
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        default:
            return
        }
        
    }
    
}


// MARK: - Configuration

private extension DeliveryAddressCell {

    func setupInitialState() {
        deliveryTitleLabel.numberOfLines = 1
        deliveryTitleLabel?.font = .systemFont(ofSize: Constants.bigFont)
        deliveryTitleLabel?.textColor = Constants.blackColor
        
        deliveryAddressLabel.numberOfLines = 3
        deliveryAddressLabel?.font = .systemFont(ofSize: Constants.smallFont)
        deliveryAddressLabel?.textColor = Constants.greyColor

        selectionStyle = .gray
        accessoryType = .disclosureIndicator
        separatorInset = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
        backgroundColor = Constants.whiteColor
    }

}
