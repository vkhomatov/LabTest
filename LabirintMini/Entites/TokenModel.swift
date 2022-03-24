//
//  TokenModel.swift
//  LabirintMini
//
//  Created by homatov on 23.03.2022.
//

import NodeKit

struct TokenEntity: Codable, DTODecodable {
    typealias DTO = TokenEntry
        
    let token: String
    let region: Region
    let developerMessage: String
    let userMessage: String
    let errorCode: Int
    let metadata: [String]
    
    static func from(dto: TokenEntry) throws -> TokenEntity {
        return .init(token: dto.token,
                     region: dto.region,
                     developerMessage: dto.developerMessage,
                     userMessage: dto.userMessage,
                     errorCode: dto.errorCode,
                     metadata: dto.metadata)
    }
}
