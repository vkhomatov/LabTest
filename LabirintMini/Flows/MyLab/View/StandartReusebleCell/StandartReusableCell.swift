//
//  StandartReusableCell.swift
//  LabirintMini
//
//  Created by homatov on 05.03.2022.
//

import UIKit

class StandartReusableCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var ValueLabel: UILabel!
    
    // MARK: - System Methods

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
