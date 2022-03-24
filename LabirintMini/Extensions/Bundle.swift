//
//  Bundle.swift
//  LabirintMini
//
//  Created by homatov on 23.03.2022.
//

import UIKit

extension Bundle {
    var releaseVersionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as? String ?? "NO"
    }
    var buildVersionNumber: String {
        return infoDictionary?["CFBundleVersion"] as? String ?? "NO"
    }
}

