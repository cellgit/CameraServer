//
//  Migrations.swift
//  App
//
//  Created by 刘宏立 on 2018/11/7.
//

import Foundation

import Vapor
import Fluent

extension MigrationConfig {
    mutating func setupModels() {
        add(model: HotKeyModel.self, database: .psql)
        
        
        add(model: User.self, database: .psql)
        add(model: AccessToken.self, database: .psql)
        add(model: RefreshToken.self, database: .psql)
        add(model: UserInfo.self, database: .psql)
        add(model: MyModel.self, database: .psql)
        
    }
}
