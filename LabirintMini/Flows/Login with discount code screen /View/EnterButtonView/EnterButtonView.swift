//
//  EnterButtonView.swift
//  LabirintMini
//
//  Created by homatov on 14.03.2022.
//

import UIKit

final class EnterButtonView: UIView {
    
    // MARK: - IBOutlets

    @IBOutlet private weak var enterButton: LongButton!
    
    // MARK: - Properites

    var touchesBegan: (() -> Void)?
    var touchesEnded: (() -> Void)?
    
    // MARK: - UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }
    
}

// MARK: - Configuration

private extension EnterButtonView {
    
    func setupInitialState() {
        backgroundColor = .none
        setCallbaks()
        enterButton.setStyle(.login(title: L10n.MyLab.login))
    }
    
    func setCallbaks() {
        enterButton?.touchesBegan = { [weak self] in
            self?.touchesBegan?()
        }
        
        enterButton?.touchesEnded = { [weak self] in
            self?.touchesEnded?()
        }
    }
    
}
