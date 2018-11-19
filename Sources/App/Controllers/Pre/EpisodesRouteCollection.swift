//
//  EpisodesRouteCollection.swift
//  App
//
//  Created by 刘宏立 on 2018/10/28.
//

import Foundation
import Vapor


final class EpisodesRouteCollection: RouteCollection {
    func boot(router: Router) throws {
        
        
        router.group("v1") { group in
            
            /// http://localhost:8080/v1/episode
            group.get("episode") {
                req -> String in
                return "Episode list"
            }
            
            /// http://localhost:8080/v1/users
            group.get("users") { req -> String in
                return "User list"
            }
        }
        
        
        let subgroup = router.grouped("episodes", Int.parameter)
        
        /// http://localhost:8080/episodes/10/play
        subgroup.post("play") { req -> String in
            let id = try req.parameters.next(Int.self)
            return "play episode \(id)"
        }
        
        /// http://localhost:8080/episodes/10/finish
        subgroup.post("finish") { req -> String in
            let id = try req.parameters.next(Int.self)
            return "finish episode \(id)"
        }
        
        
//        router.post("upload") { req -> Future<Response> in
//            let hardcoded = getEpisode(from: req)
//            
//            let decoded = try req.content.decode(Episode.self)
//            
//            return flatMap(to: [Episode].self, hardcoded, decoded, { (ep1, ep2) in
//                return req.future([ep1, ep2])
//                }.encode(status: .created, for: req)
//        }
        
        
        
        
    }
    
    
    
    
    
    
    
    
}
