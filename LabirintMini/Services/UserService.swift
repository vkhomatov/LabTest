//
//  UserService.swift
//  LabirintMini
//
//  Created by homatov on 23.03.2022.
//

import NodeKit

enum UserServiceRoute: UrlRouteProvider {
    private enum Constants {
        static let base = URL(string: "https://apitest.labirint.ru/v3")
    }
    
    case token
    case login
    
    func url() throws -> URL {
        switch self {
        case .token:
            return try Constants.base + "/token"
        case .login:
            return try Constants.base + "/user/login"
        }
    }
}

protocol UserServiceProtocol {
    func getToken(with parameters: [String : String]) -> Observer<TokenEntity>
    func loginWithBody(with parameters: [String : String], code: String) -> Observer<UserEntity>
}

final class UserService: UserServiceProtocol {
    
    var builder: UrlChainsBuilder<UserServiceRoute> {
        return .init()
    }

    func getToken(with parameters: [String : String]) -> Observer<TokenEntity> {
        return builder
            .route(.get, .token)
            .encode(as: .urlQuery)
            .set(query: parameters)
            .build()
            .process()
    }
    
    func loginWithBody(with parameters: [String : String], code: String) -> Observer<UserEntity> {
        let model = AuthEntity(code: code)
        return builder
            .route(.post, .login)
            .encode(as: .formUrl)
            .set(query: parameters)
            .build()
            .process(model)
    }
    
}
