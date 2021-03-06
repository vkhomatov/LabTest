//
//  MyLabStandartReusableCell.swift
//  LabirintMini
//
//  Created by homatov on 05.03.2022.
//

import UIKit
import ReactiveDataDisplayManager

enum CellValueTextColor {
    case gray
    case red
}

struct MyLabStandartCellModel {
    let myOrders: Int
    let myCoupons: Int
    let couponsOnFire: Int
    let myGoods: Int
    let mySubscriptions: Int
    let myPurchasedGoods: Int
    let delivryAddress: String
    let pickupPoints: Int
    
    init(from user: UserModel) {
        self.myOrders = user.myOrders ?? 0
        self.myCoupons = user.myCoupons ?? 0
        self.couponsOnFire = user.couponsOnFire ?? 0
        self.myGoods = user.myGoods ?? 0
        self.myPurchasedGoods = user.myPurchasedGoods ?? 0
        self.mySubscriptions = user.mySubscriptions ?? 0
        self.delivryAddress = user.delivryAddress ?? ""
        self.pickupPoints = user.pickupPoints ?? 0
    }
}

// MARK: - CellViewModel

struct MyLabCellViewModel {
    
    var title: String {
        switch type {
        case .myOrders:
            return L10n.MyLab.myOrders
        case .myCoupons:
            return L10n.MyLab.myCoupons
        case .myGoods:
            return L10n.MyLab.savingGoods
        case .mySubscription:
            return L10n.MyLab.mySubscriptions
        case .purchasedGoods:
            return L10n.MyLab.purchasedGoods
        case .myReviews:
            return L10n.MyLab.myReviews
        case .pickupPoints(let points):
            return L10n.MyLab.pickupPoints(points)
        case .profileSetting:
            return L10n.MyLab.profileSettings
        case .appSetting:
            return L10n.MyLab.appSettings
        case .aboutStore:
            return L10n.MyLab.storeInformation
        case .delivery:
            return L10n.MyLab.delivery
        case .logout:
            return L10n.MyLab.logout
        case .login:
            return L10n.MyLab.login
        }
    }
    
    let type: MyLabRowTypes
    var value: String? = nil
    var valueTextColor: CellValueTextColor = .red
    var roundСorners: Bool = false
}

// MARK: - CellClass

final class MyLabStandartCell: UITableViewCell, ConfigurableItem {
    
    // MARK: - Typealias

    internal typealias Model = MyLabCellViewModel

    // MARK: - Constants
    
    private enum Constants {
        static let bigFont: CGFloat = 17
        static let smallFont: CGFloat = 14
        static let cornerRadius: CGFloat = 6
    }
    
    // MARK: - IBOutlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    
    // MARK: - Properites
    
    var didPushCallback: (() -> Void)?
    
    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        configureGestureRecognizer()
    }

    // MARK: - Internal

    func configure(with model: Model) {
        titleLabel.text = model.title
        valueLabel.text = model.value
        
        switch model.valueTextColor {
        case .gray:
            valueLabel.textColor = ColorAssets.greyColor.color
        case .red:
            valueLabel.textColor = ColorAssets.labelRedColor.color
        }

        if model.roundСorners {
            layer.masksToBounds = true
            layer.cornerRadius = Constants.cornerRadius
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
    }
    
}

// MARK: - Configuration

private extension MyLabStandartCell {

    func setupInitialState() {
        configureCell()
        configureTitleLabel()
        configureValueLabel()
        configureGestureRecognizer()
    }
    
    func configureCell() {
        selectionStyle = .gray
        accessoryType = .disclosureIndicator
        separatorInset = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
        backgroundColor = ColorAssets.whiteColor.color
    }
    
    func configureTitleLabel() {
        titleLabel.numberOfLines = 1
        titleLabel?.font = .systemFont(ofSize: Constants.bigFont)
        titleLabel?.textColor = ColorAssets.blackColor.color
    }
    
    func configureValueLabel() {
        valueLabel.numberOfLines = 1
        valueLabel?.font = .systemFont(ofSize: Constants.smallFont)
        valueLabel?.textColor = ColorAssets.labelRedColor.color
    }
    
    func configureGestureRecognizer() {
        let panGesture = UITapGestureRecognizer(target: self,action: #selector(gestureAction))
        addGestureRecognizer(panGesture)
    }

}

// MARK: - Actions

private extension MyLabStandartCell {

    @objc func gestureAction() {
        didPushCallback?()
    }

}
