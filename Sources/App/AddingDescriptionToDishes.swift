//
//  AddingDescriptionToDishes.swift
//  App
//
//  Created by 刘宏立 on 2018/10/26.
//

import Foundation
import Vapor
import FluentPostgreSQL



class AddingDescriptionToDishes: Migration {
    
    typealias Database = PostgreSQLDatabase
    
    static func prepare(on conn: PostgreSQLConnection) -> EventLoopFuture<Void> {
        return Database.update(Dish.self, on: conn) { builder in
            builder.field(for: \.hotkey)
        }
    }
    
//    static func revert(on conn: PostgreSQLConnection) -> EventLoopFuture<Void> {
//        return Database.update(Dish.self, on: conn) { builder in
////            builder.field(for: \.description)
//            builder.deleteField(for: \.hotkey)
//        }
//    }
    
}
