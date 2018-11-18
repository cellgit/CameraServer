//
//  AuthContainer.swift
//  Camera
//
//  Created by 刘宏立 on 2018/11/18.
//

import Vapor

struct AuthContainer: Content {
    
    let accessToken: AccessToken.Token
    let expiresIn: TimeInterval
    let refreshToken: RefreshToken.Token
    
    init(accessToken: AccessToken,refreshToken: RefreshToken) {
        self.accessToken = accessToken.tokenString
        self.expiresIn = AccessToken.accessTokenExpirationInterval
        self.refreshToken = refreshToken.tokenString
    }
    
}

struct RefreshTokenContainer: Content {
    
    let refreshToken: RefreshToken.Token
    
}

