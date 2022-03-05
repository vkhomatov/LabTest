//
//  DeliveryAddressCell.swift
//  LabirintMini
//
//  Created by homatov on 05.03.2022.
//

import UIKit

class DeliveryAddressCell: UITableViewCell {
    
    // MARK: - IBOutlets

    @IBOutlet weak var DeliveryTitleLabel: UILabel!
    @IBOutlet weak var DeliveryAddressLabel: UILabel!
    
    // MARK: - System Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
