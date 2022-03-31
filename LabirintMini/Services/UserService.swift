//
//  UserService.swift
//  LabirintMini
//
//  Created by homatov on 23.03.2022.
//

import NodeKit

//let base = URL(string: "https://apitest.labirint.ru/v3")
let base = URL(string: "https://api.labirint.ru/v3")

enum UserServiceRoute: UrlRouteProvider {
    case token
    case login
    
    func url() throws -> URL {
        switch self {
        case .token:
            return try base + "/token"
        case .login:
            return try base + "/user/login"
        }
    }
}

protocol UserServiceProtocol {
    func getToken(with parameters: [String : String]) -> Observer<TokenEntity>
    func login(with parameters: [String : String]) -> Observer<UserEntity>
}

final class UserService: UserServiceProtocol {
    
    var builder: UrlChainsBuilder<UserServiceRoute> {
        return .init()
    }

    func getToken(with parameters: [String : String]) -> Observer<TokenEntity> {
        return self.builder
            .route(.get, .token)
            .encode(as: .urlQuery)
            .set(query: parameters)
            .build()
            .process()
    }
    
    func login(with parameters: [String : String]) -> Observer<UserEntity> {
        return self.builder
            .route(.post, .login)
            .encode(as: .urlQuery)
            .set(query: parameters)
            .build()
            .process()
    }
    
}
