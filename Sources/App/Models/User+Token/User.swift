//
//  User.swift
//  App
//
//  Created by 刘宏立 on 2018/11/18.
//

//import Foundation

import Authentication


struct User: BaseSQLModel {
    var id: Int?
    
    var userID: String?
    
    static var entity: String { return self.name + "s" }
    
    private(set) var account: String
    var password: String
    
    init(userID: String, account: String, password: String) {
        self.userID = userID
        self.account = account
        self.password = password
    }
    
    static var createdAtKey: TimestampKey? = \User.createdAt
    static var updatedAtKey: TimestampKey? = \User.updatedAt
    
    var createdAt: Date?
    var updatedAt: Date?
}


extension User: BasicAuthenticatable {
    static var usernameKey: WritableKeyPath<User, String> = \.account
    static var passwordKey: WritableKeyPath<User, String> = \.password
}
