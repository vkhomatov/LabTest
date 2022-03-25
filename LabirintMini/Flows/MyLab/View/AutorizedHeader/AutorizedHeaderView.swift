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
    let nextDiscount: Int
    let nextDiscountSumm: Int
    
    init(from user: UserModel) {
        self.name = user.name
        self.number = user.number
        self.discount = user.discount
        self.balance = user.balance
        self.nextDiscount = user.nextDiscount
        self.nextDiscountSumm = user.nextDiscountSumm
    }
}

class AutorizedHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Typealias

    typealias Model = MyLabAuthorizedHeaderDataModel
    
    // MARK: - Constants

    enum Constants {
        static let greyColor = UIColor(red: 0.616, green: 0.616, blue: 0.616, alpha: 1)
        static let whiteColor: UIColor = .white
        static let headerHeight: CGFloat = 208
        static let bigFont: CGFloat = 27
        static let middleFont: CGFloat = 14
        static let preMiddleFont: CGFloat = 13
        static let smallFont: CGFloat = 12
    }
    
    // MARK: - IBOutlets

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var discountTitleLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var discountInfoLabel: UILabel!
    @IBOutlet weak var balanceTitleLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var ballanceInfoImageView: UIImageView!
    @IBOutlet weak var discountInfoImageView: UIImageView!
    
    // MARK: - System Methods
    
    class func instanceFromNib() -> UIView? {
        return UINib(nibName: "AutorizedHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? UIView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureNameLabel()
        configureNumberLabel()
        configureDiscountTitleLabel()
        configureDiscountLabel()
        configureDiscountInfoLabel()
        configureBalanceTitleLabel()
        configureBalanceLabel()
        configureImages()
    }
    
    // MARK: - Internal Methods
    
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

    func configureNameLabel() {
        nameLabel.numberOfLines = 1
        nameLabel?.font = .systemFont(ofSize: Constants.middleFont)
        nameLabel?.textColor = Constants.whiteColor
    }
    
    func configureNumberLabel() {
        numberLabel.numberOfLines = 1
        numberLabel?.font = .systemFont(ofSize: Constants.middleFont)
        numberLabel?.textColor = Constants.greyColor
    }

    func configureDiscountTitleLabel() {
        discountTitleLabel.numberOfLines = 1
        discountTitleLabel?.font = .systemFont(ofSize: Constants.preMiddleFont)
        discountTitleLabel?.textColor = .white
    }
    
    func configureDiscountLabel() {
        discountLabel.numberOfLines = 1
        discountLabel?.font = .systemFont(ofSize: Constants.bigFont)
        discountLabel?.textColor = Constants.whiteColor
    }
    
    func configureDiscountInfoLabel() {
        discountInfoLabel.numberOfLines = 2
        discountInfoLabel?.font = .systemFont(ofSize: Constants.smallFont)
        discountInfoLabel?.textColor = Constants.greyColor
    }
    
    func configureBalanceTitleLabel() {
        balanceTitleLabel.numberOfLines = 1
        balanceTitleLabel?.font = .systemFont(ofSize: Constants.preMiddleFont)
        balanceTitleLabel?.textColor = .white
    }
    
    func configureBalanceLabel() {
        balanceLabel.numberOfLines = 1
        balanceLabel?.font = .systemFont(ofSize: Constants.bigFont)
        balanceLabel?.textColor = Constants.whiteColor
    }
    
    func configureImages() {
        ballanceInfoImageView.image = Assets.TabBar.infoIcon.image
        discountInfoImageView.image = Assets.TabBar.infoIcon.image
    }
    
}

final class AutorizedHeaderGenerator: TableHeaderGenerator {
    
    // MARK: - Constants

    enum Constants {
        static let headerHeight: CGFloat = 200
    }

    // MARK: - Private Properties

    private lazy var header: AutorizedHeaderView? = AutorizedHeaderView.instanceFromNib() as? AutorizedHeaderView
    var model: MyLabAuthorizedHeaderDataModel
    
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

