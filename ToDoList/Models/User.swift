//
//  User.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import Foundation

struct User : Codable {
    let uid : String
    let name : String
    let joinDate : Date
    let email : String
    let password : String
}
