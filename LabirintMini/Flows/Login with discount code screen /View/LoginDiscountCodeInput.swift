//
//  LoginDiscountCodeInput.swift
//  LabirintMini
//
//  Created by homatov on 14.03.2022.
//

protocol LoginDiscountCodeInput: AnyObject {
    
    func setCodeTextEditErrorState()
    
    func blockScreen(block: Bool)
    
    func showAlert(title: String, message: String)

}
