//
//  EnterButtonView.swift
//  LabirintMini
//
//  Created by homatov on 14.03.2022.
//

import UIKit

class EnterButtonView: UIView {
    
    // MARK: - Constants

    enum Constants {
        static let greyColor = UIColor(red: 0.616, green: 0.616, blue: 0.616, alpha: 1)
        static let blueColor = UIColor(red: 0.024, green: 0.314, blue: 0.761, alpha: 1)
        static let bigFont: CGFloat = 15
        static let smallFont: CGFloat = 13
    }
    
    // MARK: - IBOutlets

    @IBOutlet weak var enterButton: UIButton!
    
    // MARK: - IBActions

    @IBAction func enterButtonTouchDown(_ sender: UIButton) {
        enterButton.backgroundColor = Constants.greyColor
    }

    @IBAction func enterButtonTouchUpOutside(_ sender: UIButton) {
        enterButton.backgroundColor = Constants.blueColor
    }
    
    @IBAction func enterButtonTouchUp(_ sender: UIButton) {
        enterButton.backgroundColor = Constants.blueColor
    }
    
    // MARK: - System Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }
    
}

// MARK: - Configuration

private extension EnterButtonView {
    
    func setupInitialState() {
        backgroundColor = .none
        enterButton.isEnabled = false
        enterButton.setStyle(.enterCode(title: L10n.MyLab.login))
    }
    
}
