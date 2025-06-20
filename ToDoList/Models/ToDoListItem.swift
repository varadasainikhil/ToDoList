//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import FirebaseFirestore
import Foundation

struct ToDoListItem : Identifiable, Codable{
    @DocumentID var id : String?
    var title : String
    var description : String
    var date : Date
}
