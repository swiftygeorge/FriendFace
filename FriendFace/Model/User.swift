//
//  User.swift
//  FriendFace
//
//  Created by George Mapaya on 2022-03-01.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    
    let tags: [String]
    let friends: [Friend]
    
    var joined: Date {
        guard let date = try? Date(registered, strategy: .iso8601) else { return Date() }
        return date
    }
}


