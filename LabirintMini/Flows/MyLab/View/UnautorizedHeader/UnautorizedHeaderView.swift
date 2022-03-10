//
//  UnautorizedHeaderView.swift
//  LabirintMini
//
//  Created by homatov on 05.03.2022.
//

import UIKit
import ReactiveDataDisplayManager


class UnautorizedHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Constants

    enum Constants {
        static let greyColor = UIColor(red: 0.616, green: 0.616, blue: 0.616, alpha: 1)
        static let headerHeight: CGFloat = 208
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    
    // MARK: - System Methods
    
    class func instanceFromNib() -> UIView? {
        return UINib(nibName: "UnautorizedHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? UIView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
        self.backgroundColor = .black
    }
}


// MARK: - Configuration

private extension UnautorizedHeaderView {

    func setupInitialState() {
        
        mainLabel.numberOfLines = 2
        mainLabel?.font = .systemFont(ofSize: 15)
        mainLabel?.textColor = .white
        mainLabel.text = L10n.signInToGetAllTheFeaturesOfTheProfile
        
        infoLabel.numberOfLines = 2
        infoLabel?.font = .systemFont(ofSize: 13)
        infoLabel?.textColor = Constants.greyColor
        infoLabel?.text = L10n.byLoggingInOrRegisteringIAgreeWithTermsAndConditions
        
        enterButton.titleLabel?.text = L10n.login
        enterButton.backgroundColor = .white
        enterButton.setTitleColor(.blue, for: .normal)

    }

}

final class UnautorizedHeaderGenerator: TableHeaderGenerator {
    
    // MARK: - Constants

    enum Constants {
        static let headerHeight: CGFloat = 208
    }

    // MARK: - Private Properties

    private lazy var header: UnautorizedHeaderView? = UnautorizedHeaderView.instanceFromNib() as? UnautorizedHeaderView

    // MARK: - TableHeaderGenerator

    override func generate() -> UIView {
        header?.backgroundColor = .black
        return header ?? UIView()
    }

    override func height(_ tableView: UITableView, forSection section: Int) -> CGFloat {
        return Constants.headerHeight
    }

}

