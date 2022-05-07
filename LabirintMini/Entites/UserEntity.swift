//
//  UserEntity.swift
//  LabirintMini
//
//  Created by homatov on 25.03.2022.
//

import NodeKit

struct UserEntity: DTODecodable {
    typealias DTO = UserEntry
            
    let user: User?
    let developerMessage: String?
    let userMessage: String?
    let errorCode: Int?
    let metadata: MetaData?
    
    static func from(dto: UserEntry) throws -> UserEntity {
        return .init(user: dto.user,
                     developerMessage: dto.developerMessage,
                     userMessage: dto.userMessage,
                     errorCode: dto.errorCode,
                     metadata: dto._metadata)
    }
}
