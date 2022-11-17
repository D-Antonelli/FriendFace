//
//  Friend.swift
//  FriendFace
//
//  Created by Derya Antonelli on 14/11/2022.
//

import Foundation

struct User: Codable, Hashable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int16
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}

struct Friend: Codable, Hashable {
    let id: String
    let name: String
}



