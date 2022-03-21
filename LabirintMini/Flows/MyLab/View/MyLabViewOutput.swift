//
//  MyLabViewOutput.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import Foundation

protocol MyLabViewOutput {

    func viewLoaded()
    
    func changeState(with state: LoginState)

}
