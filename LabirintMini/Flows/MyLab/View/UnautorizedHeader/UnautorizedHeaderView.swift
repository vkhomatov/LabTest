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
        static let whiteColor: UIColor = .white
        static let headerHeight: CGFloat = 208
        static let bigFont: CGFloat = 15
        static let smallFont: CGFloat = 13
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    
    // MARK: - IBActions

    @IBAction func enterButtonTouchDown(_ sender: UIButton) {
        enterButton.backgroundColor = Constants.greyColor
    }
    
    @IBAction func enterButtonTouchUp(_ sender: UIButton) {
        enterButton.backgroundColor = Constants.whiteColor
    }
    // MARK: - System Methods
    
    class func instanceFromNib() -> UIView? {
        return UINib(nibName: "UnautorizedHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? UIView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }
}


// MARK: - Configuration

private extension UnautorizedHeaderView {

    func setupInitialState() {
        
        mainLabel.numberOfLines = 2
        mainLabel?.font = .systemFont(ofSize: Constants.bigFont)
        mainLabel?.textColor = Constants.whiteColor
        mainLabel.text = L10n.signInToGetAllTheFeaturesOfTheProfile
        
        infoLabel.numberOfLines = 2
        infoLabel?.font = .systemFont(ofSize: Constants.smallFont)
        infoLabel?.textColor = Constants.greyColor
        
        let infoText = NSMutableAttributedString.init(string:  L10n.byLoggingInOrRegisteringIAgreeWithTermsAndConditions)
        if Locale.current.languageCode == "en"{
            infoText.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 43, length: 5))
            infoText.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 53, length: 10))
        } else if Locale.current.languageCode == "ru" {
            infoText.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 38, length: 11))
            infoText.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 52, length: 9))
        }

        infoLabel.attributedText = infoText
        enterButton.loginButton(title: L10n.login)
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

