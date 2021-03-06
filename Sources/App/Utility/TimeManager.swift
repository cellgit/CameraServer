//
//  TimeManager.swift
//  App
//
//  Created by 刘宏立 on 2018/11/19.
//

import Vapor

struct TimeManager {
    
    static let shared = TimeManager()
    
    fileprivate let matter = DateFormatter()
    
    init() {
        matter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        matter.timeZone = TimeZone(identifier: "Asia/Shanghai")
    }
    
    func current() -> String {
        return matter.string(from: Date())
    }
    
}

extension TimeManager {
    
    // Static func
    static func current() -> String {
        return self.shared.matter.string(from: Date())
    }
    
    static func currentDate() -> TimeInterval {
        return Date().timeIntervalSince1970
    }
    
}

