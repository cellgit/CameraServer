//
//  HotKeyModel.swift
//  App
//
//  Created by 刘宏立 on 2018/10/30.
//

import Foundation

import Vapor
import FluentPostgreSQL


final class HotKeyModel: Content {
    var id: Int?
    ///快捷键名字
    var hotkey: String
    /// 快捷键功能
    var function: String
    
    
    init(id: Int, hotkey: String, function: String) {
        //        self.id = id
        self.hotkey = hotkey
        self.function = function
    }
    
}

extension HotKeyModel : PostgreSQLModel{
    /// 创建表: HotKeys
    static var entity: String = "HotKeys"
}

extension HotKeyModel : Migration{}

extension HotKeyModel : Parameter{}


