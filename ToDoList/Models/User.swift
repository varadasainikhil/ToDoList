//
//  User.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import Foundation

struct User : Codable {
    let id : String
    let name : String
    let joinDate : TimeInterval
    let email : String
}
