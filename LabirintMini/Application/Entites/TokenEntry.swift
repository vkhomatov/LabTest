//
//  TokenEntry.swift
//  LabirintMini
//
//  Created by homatov on 23.03.2022.
//

import NodeKit

struct TokenEntry: Codable, RawDecodable {
    typealias Raw = Json
    
    let token: String
    let region: Region
    let developerMessage: String
    let userMessage: String
    let errorCode: Int
    let _metadata: MetaData
}

struct Region: Codable, RawDecodable  {
    typealias Raw = Json
    
     let regionId: Int
     let mo: Bool
     let regionName: String
     let lat: Double
     let lon: Double
     let phoneSupport: String
     let deliveryDateString: String
     let haveNewExw: Bool
     let haveExWorks: Bool
     let exwLastUpdate: Int
     let newExwCount: Int
     let zipCode: String
     let isRussia: Int
}

struct MetaData: Codable, RawDecodable {
    typealias Raw = Json

    let lastUpdate: Int
}
