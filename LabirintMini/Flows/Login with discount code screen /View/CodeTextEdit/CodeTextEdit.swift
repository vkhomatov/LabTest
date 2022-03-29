//
//  CodeTextEdit.swift
//  LabirintMini
//
//  Created by homatov on 15.03.2022.
//

import UIKit

enum CodeTextEditState {
    case yesText(top: CGFloat = -50)
    case noText(top: CGFloat = 0)
}

public final class CodeTextEdit: UITextField {

    // MARK: - Properties

    var placeholderPadding = UIEdgeInsets.zero
    var placeHolderYesText: (() -> Void)?

    // MARK: - UITextField
    
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: placeholderPadding)
    }
}

// MARK: - Methods

extension CodeTextEdit {

    func setPlaceHolderPading(_ state: CodeTextEditState) {
        switch state {

        case .noText(let top):
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
                self?.placeholderPadding = UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0)
                self?.layoutIfNeeded()
            })
    
        case .yesText(let top):
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
                self?.placeholderPadding = UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0)
                self?.layoutIfNeeded()
            }, completion: { [weak self] _ in
                self?.placeHolderYesText?()
            })
        }

    }

}
