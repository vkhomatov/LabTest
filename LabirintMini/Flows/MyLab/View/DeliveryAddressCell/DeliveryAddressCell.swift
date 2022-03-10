//
//  DeliveryAddressCell.swift
//  LabirintMini
//
//  Created by homatov on 05.03.2022.
//

import UIKit
import ReactiveDataDisplayManager


// MARK: - CellViewModel

struct DeliveryAddressCellViewModel {
    let title: String
    let address: String
}

class DeliveryAddressCell: UITableViewCell, ConfigurableItem {

    // MARK: - Typealias

    typealias Model = DeliveryAddressCellViewModel
    
    // MARK: - Constants
    
    enum Constants {
        static let greyColor = UIColor(red: 0.616, green: 0.616, blue: 0.616, alpha: 1)
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
        deliveryAddressLabel.text = model.address
    }
    
}


// MARK: - Configuration

private extension DeliveryAddressCell {

    func setupInitialState() {
        deliveryTitleLabel.numberOfLines = 1
        deliveryTitleLabel.backgroundColor = .clear
        deliveryTitleLabel?.font = .systemFont(ofSize: 17)
        deliveryTitleLabel?.textColor = .black
        
        deliveryAddressLabel.numberOfLines = 1
        deliveryAddressLabel.backgroundColor = .clear
        deliveryAddressLabel?.font = .systemFont(ofSize: 14)
        deliveryAddressLabel?.textColor = Constants.greyColor

        self.selectionStyle = .gray
        self.accessoryType = .disclosureIndicator
    }

}
