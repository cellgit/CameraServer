//
//  AuthUserMiddleware.swift
//  App
//
//  Created by 刘宏立 on 2018/11/19.
//

import Vapor

struct AuthUserMiddleware: Middleware {
    
    func respond(to request: Request, chainingTo next: Responder) throws -> EventLoopFuture<Response> {
        
        // ...
        
        return try next.respond(to: request)
    }
    
}


