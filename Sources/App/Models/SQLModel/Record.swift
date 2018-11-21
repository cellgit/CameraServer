//
//  Record.swift
//  App
//
//  Created by 刘宏立 on 2018/11/20.
//

//动态
struct Record: BaseSQLModel {
    
    var id: Int?
    
    static var entity: String { return self.name + "s" }
    
    var userID: String
    var content: String?
    var title: String
    var county: String?
    
    var time: String
    var imgName: String?
    
}
