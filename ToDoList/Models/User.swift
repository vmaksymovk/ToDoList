//
//  User.swift
//  ToDoList
//
//  Created by Влад on 5/15/23.
//

import Foundation

struct User : Codable {
    
    let id : String
    let name : String
    let email : String
    let joined : TimeInterval
    
}
