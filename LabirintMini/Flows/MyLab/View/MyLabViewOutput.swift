//
//  MyLabViewOutput.swift
//  LabirintMini
//
//  Created by homatov on 01.03.2022.
//

import Foundation

enum LogState {
    case login 
    case loguot
}

protocol MyLabViewOutput {

    func viewLoaded()
    
    func changeState(_ state: LogState)

}
