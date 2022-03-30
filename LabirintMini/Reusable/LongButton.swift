//
//  LongButton.swift
//  LabirintMini
//
//  Created by homatov on 29.03.2022.
//

import UIKit

enum LongButtonStyle {
    case login(title: String)
    case enterCode(title: String)
}

final class LongButton: UIButton {
    
    // MARK: - Constants

    enum Constants {
        static let fontSize: CGFloat = 16
        static let cornerRadius: CGFloat = 6
    }
    
    // MARK: - Properites

    var touchesBegan: (() -> Void)?
    var touchesEnded: (() -> Void)?
    private var style: LongButtonStyle?
    
    // MARK: - UIButton

    override func awakeFromNib() {
        super.awakeFromNib()
        configureInitialState()
    }

    // MARK: - Configuration

    func setStyle(_ style: LongButtonStyle) {
        self.style = style
        switch style {
        case .enterCode(let title):
            setTitle(title, for: .normal)
            backgroundColor = ColorAssets.whiteColor.color
            setTitleColor(ColorAssets.blueColor.color, for: .normal)
        case .login(let title):
            setTitle(title, for: .normal)
            backgroundColor = ColorAssets.blueColor.color
            setTitleColor(ColorAssets.whiteColor.color, for: .normal)
        }
    }

}

// MARK: - Configuration

private extension LongButton {

    func configureInitialState() {
        layer.masksToBounds = true
        layer.cornerRadius = Constants.cornerRadius
        titleLabel?.font = .systemFont(ofSize: Constants.fontSize)
    }

}

// MARK: - Actions

extension LongButton {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        backgroundColor = ColorAssets.greyColor.color
        touchesBegan?()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        switch style {
        case .enterCode:
            backgroundColor = ColorAssets.whiteColor.color
        case .login:
            backgroundColor = ColorAssets.blueColor.color
        default:
            break
        }
        touchesEnded?()
    }

}
