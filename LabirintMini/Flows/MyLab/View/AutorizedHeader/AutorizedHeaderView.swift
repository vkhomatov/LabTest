//
//  AutorizedHeaderView.swift
//  LabirintMini
//
//  Created by homatov on 05.03.2022.
//

import UIKit
import ReactiveDataDisplayManager


class AutorizedHeaderView: UITableViewHeaderFooterView {
    
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
        setupInitialState()
    }
}


// MARK: - Configuration

private extension AutorizedHeaderView {

    func setupInitialState() {
        nameLabel.numberOfLines = 1
        nameLabel?.font = .systemFont(ofSize: Constants.middleFont)
        nameLabel?.textColor = Constants.whiteColor

        numberLabel.numberOfLines = 1
        numberLabel?.font = .systemFont(ofSize: Constants.middleFont)
        numberLabel?.textColor = Constants.greyColor
        
        discountTitleLabel.numberOfLines = 1
        discountTitleLabel?.font = .systemFont(ofSize: Constants.preMiddleFont)
        discountTitleLabel?.textColor = .white
        discountTitleLabel.text = L10n.MyLab.discount
        
        discountLabel.numberOfLines = 1
        discountLabel?.font = .systemFont(ofSize: Constants.bigFont)
        discountLabel?.textColor = Constants.whiteColor
        
        discountInfoLabel.numberOfLines = 2
        discountInfoLabel?.font = .systemFont(ofSize: Constants.smallFont)
        discountInfoLabel?.textColor = Constants.greyColor
        discountInfoLabel.text = L10n.MyLab.discountIncrease

        balanceTitleLabel.numberOfLines = 1
        balanceTitleLabel?.font = .systemFont(ofSize: Constants.preMiddleFont)
        balanceTitleLabel?.textColor = .white
        balanceTitleLabel.text = L10n.MyLab.balance
        
        balanceLabel.numberOfLines = 1
        balanceLabel?.font = .systemFont(ofSize: Constants.bigFont)
        balanceLabel?.textColor = Constants.whiteColor
        
        ballanceInfoImageView.image = Assets.MyLab.ic.image
        discountInfoImageView.image = Assets.MyLab.ic.image
    }

}

final class AutorizedHeaderGenerator: TableHeaderGenerator {
    
    // MARK: - Constants

    enum Constants {
        static let headerHeight: CGFloat = 200
    }

    // MARK: - Private Properties

    private lazy var header: AutorizedHeaderView? = AutorizedHeaderView.instanceFromNib() as? AutorizedHeaderView

    // MARK: - TableHeaderGenerator

    override func generate() -> UIView {
        return header ?? UIView()
    }

    override func height(_ tableView: UITableView, forSection section: Int) -> CGFloat {
        return Constants.headerHeight
    }

}

