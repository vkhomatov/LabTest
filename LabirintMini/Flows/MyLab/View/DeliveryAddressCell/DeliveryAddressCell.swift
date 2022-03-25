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

    typealias Model = MyLabCellViewModel
    
    // MARK: - Constants
    
    enum Constants {
        static let bigFont: CGFloat = 17
        static let smallFont: CGFloat = 13
        static let cornerRadius: CGFloat = 6
    }
    
    // MARK: - IBOutlets

    @IBOutlet weak var deliveryTitleLabel: UILabel!
    @IBOutlet weak var deliveryAddressLabel: UILabel!
    
    // MARK: - Properites
    
    var didPushCallback: (() -> Void)?
    
    // MARK: - System Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
        configureDeiveryTitleLabel()
        configureDeliveryAdressLabel()
        configureGestureRecognizer()
    }

    // MARK: - Internal Methods
    
    func configure(with model: Model) {
        deliveryTitleLabel.text = model.title
        deliveryAddressLabel.text = model.value
        
        if model.roundСorners {
            layer.masksToBounds = true
            layer.cornerRadius = Constants.cornerRadius
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
    }
    
}

// MARK: - Configuration

private extension DeliveryAddressCell {

    func setupInitialState() {
        selectionStyle = .gray
        accessoryType = .disclosureIndicator
        separatorInset = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
        backgroundColor = ColorAssets.whiteColor.color
    }
    
    func configureDeiveryTitleLabel() {
        deliveryTitleLabel.numberOfLines = 1
        deliveryTitleLabel?.font = .systemFont(ofSize: Constants.bigFont)
        deliveryTitleLabel?.textColor = ColorAssets.blackColor.color
    }
    
    func configureDeliveryAdressLabel() {
        deliveryAddressLabel.numberOfLines = 3
        deliveryAddressLabel?.font = .systemFont(ofSize: Constants.smallFont)
        deliveryAddressLabel?.textColor = ColorAssets.greyColor.color
    }
    
    func configureGestureRecognizer() {
        let panGesture = UITapGestureRecognizer(target: self,action: #selector(gestureAction))
        addGestureRecognizer(panGesture)
    }

}

// MARK: - Actions

private extension DeliveryAddressCell {

    @objc func gestureAction() {
        didPushCallback?()
    }

}
