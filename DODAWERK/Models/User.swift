//
//  User.swift
//  DDW
//
//  Created by Ellen Stavrou on 20/11/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let userType: String
    let joined: TimeInterval
}
