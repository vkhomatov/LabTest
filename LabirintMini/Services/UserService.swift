//
//  UserService.swift
//  LabirintMini
//
//  Created by homatov on 23.03.2022.
//

import NodeKit

let base = URL(string: "https://apitest.labirint.ru/v3")

enum UserServiceRoute: UrlRouteProvider {
    case token
    case auth
    
    func url() throws -> URL {
        switch self {
        case .token:
            return try base + "/token"
        case .auth:
            return try base + "/auth"
        }
    }
}

protocol UserServiceProtocol {
    func buildParameters(add parameters: [String : String], token: String, imagesize: String) -> [String : String]
    func getToken(with parameters: [String : String]) -> Observer<TokenEntity>
}

final class UserService: UserServiceProtocol {

    func buildParameters(add parameters: [String : String], token: String, imagesize: String) -> [String : String] {
        let parametersDict = ["build": Bundle.main.buildVersionNumber,
                              "bundleId": "91528577",
                              "debug": "true",
                              "imageSize": imagesize,
                              "token": token,
                              "version": Bundle.main.releaseVersionNumber]
        
        return parametersDict.merging(parameters) { (current, _) in current }
    }
    
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
    
}
