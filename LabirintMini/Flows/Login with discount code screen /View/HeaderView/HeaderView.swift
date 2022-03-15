//
//  HeaderView.swift
//  LabirintMini
//
//  Created by homatov on 14.03.2022.
//

import UIKit
import ReactiveDataDisplayManager

class HeaderView: UITableViewHeaderFooterView {

    // MARK: - Constants

    enum Constants {
        static let greyColor = UIColor(red: 0.616, green: 0.616, blue: 0.616, alpha: 1)
        static let whiteColor: UIColor = .white
        static let blackColor: UIColor = .black
        static let fontSize: CGFloat = 17
    }
    
    // MARK: - IBOutlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    // MARK: - Actions
    
    @IBAction func closeButton(_ sender: UIButton) {
        closeCallback?()
    }
    
    // MARK: - Properites
    
    public var closeCallback: (() -> Void)?
    
    
    // MARK: - System Methods
    
    class func instanceFromNib() -> UIView? {
        return UINib(nibName: "HeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as? UIView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }
}

// MARK: - Configuration

private extension HeaderView {

    func setupInitialState() {
        titleLabel.numberOfLines = 1
        titleLabel?.font = .systemFont(ofSize: Constants.fontSize)
        titleLabel?.textColor = Constants.blackColor
        titleLabel.text = L10n.MyLab.discountCodeTitle
        
        closeButton.backgroundColor = .clear
        closeButton.setImage(Assets.MyLab.closeButton.image, for: .normal)
    }

}

final class HeaderViewGenerator: TableHeaderGenerator {
    
    // MARK: - Constants

    enum Constants {
        static let headerHeight: CGFloat = 47
    }

    // MARK: - Private Properties

    private lazy var header: HeaderView? = HeaderView.instanceFromNib() as? HeaderView

    // MARK: - TableHeaderGenerator

    override func generate() -> UIView {
        return header ?? UIView()
    }

    override func height(_ tableView: UITableView, forSection section: Int) -> CGFloat {
        return Constants.headerHeight
    }

}
