//
//  Report.swift
//  App
//
//  Created by 刘宏立 on 2018/11/20.
//

//举报
struct Report: BaseSQLModel {
    var id: Int?
    
    static var entity: String { return self.name + "s" }
    
    var userID: String
    var content: String
    var county: String
    
    var imgName: String?
    var contact: String?
    
}
