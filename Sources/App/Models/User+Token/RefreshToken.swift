//
//  RefreshToken.swift
//  Camera
//
//  Created by 刘宏立 on 2018/11/18.
//

import Crypto

struct RefreshToken: BaseSQLModel {
    var id: Int?
    
    static var entity: String { return self.name + "s" }
    
    typealias Token = String
    
    let tokenString: Token
    let userID: String
    
    init(userID: String) throws {
        self.tokenString = try CryptoRandom().generateData(count: 32).base64URLEncodedString()
        self.userID = userID
    }
}
