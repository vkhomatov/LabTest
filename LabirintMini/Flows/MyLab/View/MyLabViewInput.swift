//
//  MyLabViewInput.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import Foundation

protocol MyLabViewInput: AnyObject {

    func setupInitialState()
    
    func configureViewState(with state: LoginState)

}
