//
//  DeliveryAddressCell.swift
//  LabirintMini
//
//  Created by homatov on 05.03.2022.
//

import UIKit
import ReactiveDataDisplayManager

final class DeliveryAddressCell: UITableViewCell, ConfigurableItem {

    // MARK: - Typealias

    internal typealias Model = MyLabCellViewModel
    
    // MARK: - Constants
    
    private enum Constants {
        static let bigFont: CGFloat = 17
        static let smallFont: CGFloat = 13
        static let cornerRadius: CGFloat = 6
    }
    
    // MARK: - IBOutlets

    @IBOutlet private weak var deliveryTitleLabel: UILabel!
    @IBOutlet private weak var deliveryAddressLabel: UILabel!
    
    // MARK: - Properites
    
    var didPushCallback: (() -> Void)?
    
    // MARK: - UITableViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }

    // MARK: - Internal
    
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
        configureCell()
        configureDeiveryTitleLabel()
        configureDeliveryAdressLabel()
        configureGestureRecognizer()
    }
    
    func configureCell() {
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
