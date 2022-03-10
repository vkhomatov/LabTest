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
        self.backgroundColor = .black
        
        nameLabel.numberOfLines = 1
        nameLabel?.font = .systemFont(ofSize: 14)
        nameLabel?.textColor = .white

        numberLabel.numberOfLines = 1
        numberLabel?.font = .systemFont(ofSize: 14)
        numberLabel?.textColor = Constants.greyColor
        
        discountTitleLabel.numberOfLines = 1
        discountTitleLabel?.font = .systemFont(ofSize: 13)
        discountTitleLabel?.textColor = .white
        
        discountLabel.numberOfLines = 1
        discountLabel?.font = .systemFont(ofSize: 27)
        discountLabel?.textColor = .white
        
        discountInfoLabel.numberOfLines = 2
        discountInfoLabel?.font = .systemFont(ofSize: 12)
        discountInfoLabel?.textColor = Constants.greyColor
        
        balanceTitleLabel.numberOfLines = 1
        balanceTitleLabel?.font = .systemFont(ofSize: 13)
        balanceTitleLabel?.textColor = .white
        
        balanceLabel.numberOfLines = 1
        balanceLabel?.font = .systemFont(ofSize: 27)
        balanceLabel?.textColor = .white
        
        ballanceInfoImageView.image = Assets.TabBar.ic.image
        discountInfoImageView.image = Assets.TabBar.ic.image
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

