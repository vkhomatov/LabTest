//
//  TokenEntry.swift
//  LabirintMini
//
//  Created by homatov on 23.03.2022.
//

import NodeKit

struct TokenEntry: Codable, RawDecodable {
    typealias Raw = Json
    
    let token: String?
    let region: Region?
    let developerMessage: String?
    let userMessage: String?
    let errorCode: Int?
    let _metadata: MetaData?
}

struct Region: Codable, RawDecodable  {
    typealias Raw = Json
    
    var exWorksCount: Int?
    var regionId: Int?
    var mo: Bool?
    var regionName: String?
    var lat: Double?
    var lon: Double?
    var phoneSupport: String?
    var deliveryDateString: String?
    var haveNewExw: Bool?
    var haveExWorks: Bool?
    var exwLastUpdate: Int?
    var newExwCount: Int?
    var zipCode: String?
    var isRussia: Int?
    
}

struct MetaData: Codable, RawDecodable {
    typealias Raw = Json

    let lastUpdate: Int
}
