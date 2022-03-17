//
//  CodeEnterCell.swift
//  LabirintMini
//
//  Created by homatov on 14.03.2022.
//

import UIKit
import ReactiveDataDisplayManager

struct CodeEnterCellViewModel {
    var text: String
    let placeholder: String
}

class CodeEnterCell: UITableViewCell, ConfigurableItem {
    
    // MARK: - Typealias

    typealias Model = CodeEnterCellViewModel
    
    // MARK: - Constants
    
    enum Constants {
        static let blackColor: UIColor = .black
        static let whiteColor: UIColor = .white
        static let bigFont: CGFloat = 17
        static let smallFont: CGFloat = 14
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var codeTextField: CodeTextEdit!
    @IBOutlet private weak var discountCodeTitle: UILabel!
    

    // MARK: - IBActions

    // 1. начал редактировать, текста нет:
    //    - анимируем placeholder в верхнюю позицию
    //    - ставим текст плейхолдера в .none
    //    - открываем и анимируем лейбл в меньший масштаб
    
    @IBAction private func codeTextFieldEditingDidBegin(_ sender: CodeTextEdit) {
        guard let text = sender.text else { return }
        editingDidBegin?(text)
        if text == "" {
            codeTextField.setPlaceHolderPading(.yesText())
        } else {
            codeTextField.placeholder = .none
        }
    }

    // 3. закончил редактировать, текста нет:
    //   - анимируем текст лейбла до нормального состояния
    //   - скрываем текст лейбла
    //   - назначаем текст плейхолдеру
    //   - анимируем плейсхолдер на старое место

    @IBAction func codeTextFieldEditinDidEnd(_ sender: UITextField) {
        guard let text = sender.text else { return }
        editingDidEnd?(text)
        if text == "" {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
                guard let self = self else { return }
                self.discountCodeTitle.transform = .identity
                self.discountCodeTitle.frame.origin = self.labelOrigin
                self.contentView.layoutIfNeeded()
            }, completion: { [weak self] _ in
                self?.discountCodeTitle.isHidden = true
                self?.codeTextField.placeholder = L10n.MyLab.discountCode
                self?.codeTextField.setPlaceHolderPading(.noText())
            })
        }
    }
        
    // MARK: - Properites
    
    public var editingDidBegin: ((_ text: String) -> Void)?
    public var editingDidEnd: ((_ text: String) -> Void)?
    private var labelOrigin = CGPoint()
    
    // MARK: - System Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInitialState()
    }
    
    // MARK: - Internal Methods
    
    func configure(with model: Model) {
        codeTextField.placeholder = model.placeholder
        codeTextField.text = model.text
        labelOrigin = discountCodeTitle.frame.origin
        discountCodeTitle.isHidden = codeTextField.text == ""
        if !discountCodeTitle.isHidden {
            discountCodeTitle.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            discountCodeTitle.frame.origin = labelOrigin
        }
    }

}


// MARK: - Configuration

extension CodeEnterCell {

    private func setupInitialState() {
        codeTextField.font = .systemFont(ofSize: Constants.bigFont)
        codeTextField.textColor = Constants.blackColor
        
        codeTextField.placeHolderYesText = { [weak self] in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
                guard let self = self else { return }
                self.codeTextField.placeholder = .none
                self.discountCodeTitle.isHidden = false
                self.discountCodeTitle.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                self.discountCodeTitle.frame.origin = self.labelOrigin
                self.contentView.layoutIfNeeded()
            })
        }
        
        discountCodeTitle.font = .systemFont(ofSize: Constants.bigFont)
        discountCodeTitle.text = L10n.MyLab.discountCode
                
        accessoryType = .none
        selectionStyle = .none
        separatorInset = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
        backgroundColor = Constants.whiteColor        
    }
    
}
