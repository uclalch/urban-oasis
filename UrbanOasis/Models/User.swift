//
//  User.swift
//  UrbanOasis
//
//  Created by Larry LI on 2024/10/15.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var username: String
    var email: String
    var userType: UserType
}

enum UserType {
    case customer
    case hotel
}
