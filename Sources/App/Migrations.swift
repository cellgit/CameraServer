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
        
        
    }
}
