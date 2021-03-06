//
//  AccessToken.swift
//  Camera
//
//  Created by 刘宏立 on 2018/11/18.
//

import Foundation

import Vapor
import Crypto
import Authentication

struct AccessToken: BaseSQLModel {
    typealias Token = String
    
    static var entity: String { return "AccessTokens" }
    
    static let accessTokenExpirationInterval: TimeInterval = 60 * 60 * 24 * 30 // 1个月
    
    var id: Int?
    
    
    private(set) var tokenString: Token
    private(set) var userID: String
    
    let expiryTime: Date
    
    
    init(userID: String) throws {
        self.tokenString = try CryptoRandom().generateData(count: 32).base64EncodedString()
        self.userID = userID
        self.expiryTime = Date().addingTimeInterval(AccessToken.accessTokenExpirationInterval)
    }
    
}


extension AccessToken: BearerAuthenticatable {
    
    static var tokenKey: WritableKeyPath<AccessToken, String> = \.tokenString
    
    public static func authenticate(using bearer: BearerAuthorization, on connection: DatabaseConnectable) -> Future<AccessToken?> {
        return Future.flatMap(on: connection) {
            return AccessToken.query(on: connection).filter(tokenKey == bearer.token).first().map { token in
                guard let token = token, token.expiryTime > Date() else { return nil }
                return token
            }
        }
    }
    
}

