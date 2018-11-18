//
//  UserInfo.swift
//  Camera
//
//  Created by 刘宏立 on 2018/11/18.
//

import Foundation




struct UserInfo: BaseSQLModel {
    var id: Int?
    
    static var entity: String { return self.name + "s" }
    
    var userID: String
    
    var age: Int?
    var sex: Int?
    
    var nickName: String?
    var phone: String?
    var birthday: String?
    var location: String?
    var picName: String?
    
}

extension UserInfo {
    
    mutating func update(with container: UserInfoContainer) -> UserInfo {
        if let new = container.age {
            self.age = new
        }
        
        if let new = container.sex {
            self.sex = new
        }
        
        if let new = container.nickName {
            self.nickName = new
        }
        
        if let new = container.phone {
            self.phone = new
        }
        
        if let new = container.birthday {
            self.birthday = new
        }
        
        if let new = container.location {
            self.location = new
        }
        
        return self
    }
}



import Vapor
struct UserInfoContainer: Content {
    
    var token:String
    
    var age: Int?
    var sex: Int?
    var nickName: String?
    var phone: String?
    var birthday: String?
    var location: String?
    var picImage: File?
    
}
