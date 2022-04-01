//
//  CodeTextEditView.swift
//  LabirintMini
//
//  Created by homatov on 30.03.2022.
//

import UIKit

enum TextEditState {
    case normal
    case error
}

final class CodeTextEditView: UIView {
    
    // MARK: - Typealias

    internal typealias Model = CodeEnterCellViewModel
    
    // MARK: - Constants
    
    private enum Constants {
        static let bigFont: CGFloat = 17
        static let smallFont: CGFloat = 14
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var codeTextField: CodeTextEdit!
    @IBOutlet private weak var discountCodeTitle: UILabel!
        
    // MARK: - Properites
    
    var editingDidBegin: ((_ text: String) -> Void)?
    var editingDidEnd: ((_ text: String) -> Void)?
    var labelOrigin = CGPoint()
    
    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }
    
    // MARK: - Internal

    func configure(with model: Model) {
        codeTextField.placeholder = model.placeholder
        codeTextField.text = model.text
    }

}

// MARK: - Configuration

private extension CodeTextEditView {
    
    func setupInitialState() {
        backgroundColor = ColorAssets.whiteColor.color
        layer.cornerRadius = 8
        clipsToBounds = false
        configureCodeTextField()
        configureDiscountCodeTitle()
    }
    
    func configureCodeTextField() {
        codeTextField.font = .systemFont(ofSize: Constants.bigFont)
        codeTextField.textColor = ColorAssets.blackColor.color
        codeTextField.backgroundColor = .clear

        
        labelOrigin = discountCodeTitle.frame.origin
        discountCodeTitle.isHidden = codeTextField.text == ""
        if !discountCodeTitle.isHidden {
            discountCodeTitle.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            discountCodeTitle.frame.origin = labelOrigin
        }
        
        codeTextField.placeHolderYesText = { [weak self] in
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
                guard let self = self else { return }
                self.codeTextField.placeholder = .none
                self.discountCodeTitle.isHidden = false
                self.discountCodeTitle.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                self.discountCodeTitle.frame.origin = self.labelOrigin
                self.layoutIfNeeded()
            })
        }
    }
    
    func configureDiscountCodeTitle() {
        discountCodeTitle.font = .systemFont(ofSize: Constants.bigFont)
        discountCodeTitle.text = L10n.MyLab.discountCode
        discountCodeTitle.backgroundColor = .clear
    }

}

// MARK: - IBActions

private extension CodeTextEditView {

    // Начал редактировать, текста нет:
    //    - анимируем placeholder в верхнюю позицию
    //    - ставим текст плейхолдера в .none
    //    - открываем и анимируем лейбл в меньший масштаб
    
    @IBAction private func codeTextFieldEditingDidBegin(_ sender: CodeTextEdit) {
        guard let text = sender.text else { return }
        editingDidBegin?(text)
        if text.isEmpty {
            codeTextField.setPlaceHolderPading(.normal)
        } else {
            codeTextField.placeholder = .none
        }
    }

    // Закончил редактировать, текста нет:
    //   - анимируем текст лейбла до нормального состояния
    //   - скрываем текст лейбла
    //   - назначаем текст плейхолдеру
    //   - анимируем плейсхолдер на старое место

    @IBAction func codeTextFieldEditingDidEnd(_ sender: UITextField) {
        guard let text = sender.text else { return }
        editingDidEnd?(text)
        if text.isEmpty {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
                guard let self = self else { return }
                self.discountCodeTitle.transform = .identity
                self.discountCodeTitle.frame.origin = self.labelOrigin
                self.layoutIfNeeded()
            }, completion: { [weak self] _ in
                guard let self = self else { return }
                self.discountCodeTitle.isHidden = true
                self.codeTextField.placeholder = L10n.MyLab.discountCode
                self.codeTextField.setPlaceHolderPading(.empty)
            })
        }
    }
}
