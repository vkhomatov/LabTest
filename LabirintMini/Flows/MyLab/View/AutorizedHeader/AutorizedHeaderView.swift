//
//  AutorizedHeaderView.swift
//  LabirintMini
//
//  Created by homatov on 05.03.2022.
//

import UIKit
import ReactiveDataDisplayManager

struct MyLabAuthorizedHeaderDataModel {
    let name: String
    let number: String
    let discount: Int
    let balance: Int
    let nextDiscount: String
    let nextDiscountSumm: Int
    
    init(from user: UserModel) {
        self.name = user.name ?? ""
        self.number = user.number ?? ""
        self.discount = user.discount ?? 0
        self.balance = user.balance ?? 0
        self.nextDiscount = user.nextDiscount ?? ""
        self.nextDiscountSumm = user.nextDiscountSumm ?? 0
    }
}

final class AutorizedHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Typealias

    internal typealias Model = MyLabAuthorizedHeaderDataModel
    
    // MARK: - Constants

    private enum Constants {
        static let headerHeight: CGFloat = 208
        static let bigFont: CGFloat = 27
        static let middleFont: CGFloat = 14
        static let preMiddleFont: CGFloat = 13
        static let smallFont: CGFloat = 12
    }
    
    // MARK: - IBOutlets

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var discountTitleLabel: UILabel!
    @IBOutlet private weak var discountLabel: UILabel!
    @IBOutlet private weak var discountInfoLabel: UILabel!
    @IBOutlet private weak var balanceTitleLabel: UILabel!
    @IBOutlet private weak var balanceLabel: UILabel!
    @IBOutlet private weak var ballanceInfoImageView: UIImageView!
    @IBOutlet private weak var discountInfoImageView: UIImageView!
    
    // MARK: - UITableViewHeaderFooterView
    
    class func instanceFromNib() -> UIView? {
        return UINib(nibName: "AutorizedHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? UIView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureInitialState()
    }
    
    // MARK: - Internal
    
    func configure(with model: Model) {
        nameLabel.text = model.name
        numberLabel.text = model.number
        discountLabel.text =  L10n.MyLab.discountSing(model.discount)
        balanceLabel.text = L10n.MyLab.balanceSing(model.balance)
        discountInfoLabel.text = L10n.MyLab.discountIncrease(model.nextDiscountSumm, model.nextDiscount)
    }
}

// MARK: - Configuration

private extension AutorizedHeaderView {
    
    func configureInitialState() {
        configureNameLabel()
        configureNumberLabel()
        configureDiscountTitleLabel()
        configureDiscountLabel()
        configureDiscountInfoLabel()
        configureBalanceTitleLabel()
        configureBalanceLabel()
        configureImages()
    }

    func configureNameLabel() {
        nameLabel.numberOfLines = 1
        nameLabel?.font = .systemFont(ofSize: Constants.middleFont)
        nameLabel?.textColor = ColorAssets.whiteColor.color
    }
    
    func configureNumberLabel() {
        numberLabel.numberOfLines = 1
        numberLabel?.font = .systemFont(ofSize: Constants.middleFont)
        numberLabel?.textColor = ColorAssets.greyColor.color
    }

    func configureDiscountTitleLabel() {
        discountTitleLabel.numberOfLines = 1
        discountTitleLabel?.font = .systemFont(ofSize: Constants.preMiddleFont)
        discountTitleLabel?.textColor = .white
    }
    
    func configureDiscountLabel() {
        discountLabel.numberOfLines = 1
        discountLabel?.font = .systemFont(ofSize: Constants.bigFont)
        discountLabel?.textColor = ColorAssets.whiteColor.color
    }
    
    func configureDiscountInfoLabel() {
        discountInfoLabel.numberOfLines = 2
        discountInfoLabel?.font = .systemFont(ofSize: Constants.smallFont)
        discountInfoLabel?.textColor = ColorAssets.greyColor.color
    }
    
    func configureBalanceTitleLabel() {
        balanceTitleLabel.numberOfLines = 1
        balanceTitleLabel?.font = .systemFont(ofSize: Constants.preMiddleFont)
        balanceTitleLabel?.textColor = .white
    }
    
    func configureBalanceLabel() {
        balanceLabel.numberOfLines = 1
        balanceLabel?.font = .systemFont(ofSize: Constants.bigFont)
        balanceLabel?.textColor = ColorAssets.whiteColor.color
    }
    
    func configureImages() {
        ballanceInfoImageView.image = Assets.TabBar.infoIcon.image
        discountInfoImageView.image = Assets.TabBar.infoIcon.image
    }
    
}

final class AutorizedHeaderGenerator: TableHeaderGenerator {
    
    // MARK: - Constants

    private enum Constants {
        static let headerHeight: CGFloat = 200
    }

    // MARK: - Private Properties

    private lazy var header: AutorizedHeaderView? = AutorizedHeaderView.instanceFromNib() as? AutorizedHeaderView
    private var model: MyLabAuthorizedHeaderDataModel
    
    // MARK: - Initialization
    
    init(model: MyLabAuthorizedHeaderDataModel) {
        self.model = model
    }

    // MARK: - TableHeaderGenerator

    override func generate() -> UIView {
        header?.configure(with: model)
        return header ?? UIView()
    }

    override func height(_ tableView: UITableView, forSection section: Int) -> CGFloat {
        return Constants.headerHeight
    }

}

