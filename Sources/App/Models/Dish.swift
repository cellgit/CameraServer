//
//  Dish.swift
//  App
//
//  Created by 刘宏立 on 2018/10/26.
//

import Foundation
import Vapor
import FluentPostgreSQL

final class Dish: Content {
    var id: Int?
    var name: String
    var course: String
    var price: String
    var imageURL: String
    var description: String
    
    
    init(id: Int, name: String, course: String, price: String, imageURL: String, description: String) {
//        self.id = id
        self.name = name
        self.course = course
        self.price = price
        self.imageURL = imageURL
        self.description = description
        
    }
    
}

extension Dish : PostgreSQLModel{
    static var entity: String = "Dishes"
}

extension Dish : Migration{}

extension Dish : Parameter{}
