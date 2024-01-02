//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Hakan Türkmen on 1.01.2024.
//

import Foundation


enum GFError : String , Error
{
    case invalidUsername = "This username is created an invalid request"
    case unableToComplete = "Unable to complete request"
    case invalidResponse = "Invalid response from the server"
    case invalidData = "Data is invalid"
}
