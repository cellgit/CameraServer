//
//  HotKeyController.swift
//  App
//
//  Created by 刘宏立 on 2018/11/7.
//

import Foundation
import Vapor


final class HotKeyController: RouteCollection {
    func boot(router: Router) throws {
        
        /// save
        router.post(HotKeyModel.self, at: "/hotkey") { req, hotkey -> Future<HotKeyModel> in
            return hotkey.save(on: req)
        }
        
        /// query
        router.post("/hotkeys") { req -> Future<[HotKeyModel]> in
            return HotKeyModel.query(on: req).all()
        }
        
    }
}
