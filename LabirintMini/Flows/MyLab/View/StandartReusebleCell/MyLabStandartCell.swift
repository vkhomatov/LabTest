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
        self.myOrders = user.myOrders
        self.myCoupons = user.myCoupons
        self.couponsOnFire = user.couponsOnFire
        self.myGoods = user.myGoods
        self.myPurchasedGoods = user.myPurchasedGoods
        self.mySubscriptions = user.mySubscriptions
        self.delivryAddress = user.delivryAddress
        self.pickupPoints = user.pickupPoints
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

class MyLabStandartCell: UITableViewCell, ConfigurableItem {
    
    // MARK: - Typealias

    typealias Model = MyLabCellViewModel

    // MARK: - Constants
    
    enum Constants {
        static let greyColor = UIColor(red: 0.616, green: 0.616, blue: 0.616, alpha: 1)
        static let redColor = UIColor(red: 0.878, green: 0.376, blue: 0.376, alpha: 1)
        static let blackColor: UIColor = .black
        static let whiteColor: UIColor = .white
        static let bigFont: CGFloat = 17
        static let smallFont: CGFloat = 14
        static let cornerRadius: CGFloat = 6
    }
    
    // MARK: - IBOutlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: - Properites
    
    var didPushCallback: (() -> Void)?
    
    // MARK: - System Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
        configureTitleLabel()
        configureValueLabel()
        configureGestureRecognizer()
    }

    // MARK: - Internal Methods

    func configure(with model: Model) {
        titleLabel.text = model.title
        valueLabel.text = model.value
        
        switch model.valueTextColor {
        case .gray:
            valueLabel.textColor = Constants.greyColor
        case .red:
            valueLabel.textColor = Constants.redColor
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
        selectionStyle = .gray
        accessoryType = .disclosureIndicator
        separatorInset = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
        backgroundColor = Constants.whiteColor
    }
    
    func configureTitleLabel() {
        titleLabel.numberOfLines = 1
        titleLabel?.font = .systemFont(ofSize: Constants.bigFont)
        titleLabel?.textColor = Constants.blackColor
    }
    
    func configureValueLabel() {
        valueLabel.numberOfLines = 1
        valueLabel?.font = .systemFont(ofSize: Constants.smallFont)
        valueLabel?.textColor = Constants.redColor

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
