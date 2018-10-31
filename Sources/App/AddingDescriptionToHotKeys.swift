//
//  AddingDescriptionToHotKeys.swift
//  App
//
//  Created by 刘宏立 on 2018/10/30.
//

import Foundation

import Vapor
import FluentPostgreSQL



class AddingDescriptionToHotKeys: Migration {
    
    typealias Database = PostgreSQLDatabase
    
    static func prepare(on conn: PostgreSQLConnection) -> EventLoopFuture<Void> {
        return Database.update(HotKeyModel.self, on: conn) { builder in
            builder.field(for: \.description)
        }
    }
    
    static func revert(on conn: PostgreSQLConnection) -> EventLoopFuture<Void> {
        return Database.update(HotKeyModel.self, on: conn) { builder in
            //            builder.field(for: \.description)
            builder.deleteField(for: \.description)
        }
    }
    
}
