//
//  Follower.swift
//  iOS-Native-Training
//
//  Created by MIN on 9/12/25.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(login)
    }
}
