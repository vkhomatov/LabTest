//
//  UnautorizedHeaderView.swift
//  LabirintMini
//
//  Created by homatov on 05.03.2022.
//

import UIKit
import ReactiveDataDisplayManager


final class UnautorizedHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Constants

    private enum Constants {
        static let headerHeight: CGFloat = 208
        static let bigFont: CGFloat = 15
        static let smallFont: CGFloat = 13
    }
    
    // MARK: - IBOutlets

    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var loginButton: LongButton!
    @IBOutlet private weak var infoLabel: UILabel!
    
    // MARK: - Properites
    
    var touchesBegan: (() -> Void)?
    var touchesEnded: (() -> Void)?
    
    // MARK: - UITableViewHeaderFooterView
    
    class func instanceFromNib() -> UIView? {
        return UINib(nibName: "UnautorizedHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? UIView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureInitialState()
    }

}

// MARK: - Configuration

private extension UnautorizedHeaderView {
    
    func configureInitialState() {
        configureMainLabel()
        configureInfolabel()
        setCallbaks()
        loginButton.setStyle(.enterCode(title: L10n.MyLab.enter))
    }

    func configureMainLabel() {
        mainLabel.numberOfLines = 2
        mainLabel?.font = .systemFont(ofSize: Constants.bigFont)
        mainLabel?.textColor = ColorAssets.whiteColor.color
        mainLabel.text = L10n.MyLab.signInInfo
    }
    
    func configureInfolabel() {
        infoLabel.numberOfLines = 3
        infoLabel?.font = .systemFont(ofSize: Constants.smallFont)
        infoLabel?.textColor = ColorAssets.greyColor.color
        
        let infoText = NSMutableAttributedString.init(string:  L10n.MyLab.signInAgree)
        if Locale.current.languageCode == "en"{
            infoText.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 43, length: 5))
            infoText.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 53, length: 10))
        } else if Locale.current.languageCode == "ru" {
            infoText.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 38, length: 11))
            infoText.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: 52, length: 9))
        }
    
        infoLabel.attributedText = infoText
    }
    
    func setCallbaks() {
        loginButton?.touchesBegan = { [weak self] in
            self?.touchesBegan?()
        }
        
        loginButton?.touchesEnded = { [weak self] in
            self?.touchesEnded?()
        }
    }
    
}

final class UnautorizedHeaderGenerator: TableHeaderGenerator {
    
    // MARK: - Constants

    private enum Constants {
        static let headerHeight: CGFloat = 208
    }
    
    // MARK: - Properites
    
    var  viewButtonCallback: (() -> Void)?

    // MARK: - Private Properties

    private lazy var header: UnautorizedHeaderView? = UnautorizedHeaderView.instanceFromNib() as? UnautorizedHeaderView
    
    // MARK: - Initialization
    
    override init() {
        super.init()
        header?.touchesEnded = { [weak self] in
            self?.viewButtonCallback?()
        }
    }

    // MARK: - TableHeaderGenerator

    override func generate() -> UIView {
        return header ?? UIView()
    }

    override func height(_ tableView: UITableView, forSection section: Int) -> CGFloat {
        return Constants.headerHeight
    }

}

