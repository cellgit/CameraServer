//
//  DefineConst.swift
//  App
//
//  Created by 刘宏立 on 2018/11/19.
//

import Foundation
import Vapor
import PerfectICONV
import Fluent
import FluentPostgreSQL


struct ImagePath {
    
    static let record = "record" //动态
    static let report = "report" // 举报
    static let userPic = "userPic" // 用户头像
    static let note = "note" //
}

public let pageCount = 20   // 每页数量
public let ImageMaxByteSize = 2048000   // 图片大小

public let PasswordMaxCount = 18    // 密码最大长度
public let passwordMinCount = 6     // 密码最小长度

public let AccountMaxCount = 18     // 账号最大长度
public let AccountMinCount = 6      // 账号最小z长度




public let CrawlerHeader: HTTPHeaders = ["User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36"
    ,"Cookie": "yunsuo_session_verify=2a87ab507187674302f32bbc33248656"]


func getHTMLResponse(_ req:Request,url: String) throws -> Future<String> {
    
    return try req.client().get(url,headers: CrawlerHeader).map {
        return $0.utf8String
    }
}





