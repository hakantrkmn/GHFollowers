//
//  User.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 1.01.2024.
//

import Foundation

struct User : Codable
{
    var login : String
    var avatarUrl : String
    var name : String?
    var location : String?
    var bio : String?
    var publicRepos : Int
    var publicGists : Int
    var htmlUrl : String
    var following : Int
    var followers : Int
    var createdAt : Date
}
