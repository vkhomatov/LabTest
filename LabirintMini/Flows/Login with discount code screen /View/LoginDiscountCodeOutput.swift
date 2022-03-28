//
//  LoginDiscountCodeOutput.swift
//  LabirintMini
//
//  Created by homatov on 14.03.2022.
//

protocol LoginDiscountCodeOutput {

    func viewLoaded()
    
    func closeModule()

    func editingDidBegin(_ text: String)
    
    func editingDidEnd(_ text: String)

}
