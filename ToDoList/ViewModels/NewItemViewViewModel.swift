//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

@Observable
class NewItemViewViewModel{
    var title : String = ""
    var description : String = ""
    var date : Date = Date.now
    var errorMessage : String = ""
    var showingError : Bool = false
    private let db = Firestore.firestore()
    private let currentUserId = Auth.auth().currentUser?.uid
    
    init(){
        
    }
    
    func validate() -> Bool{
        if title.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            errorMessage = "Please enter a title."
            showingError = true
            return false
        }
        
        if date < Date.now.addingTimeInterval(-86400) {
            errorMessage = "Please add a date in the future."
            showingError = true
            return false
        }
        return true
    }
    
    func createToDoListItem() async -> Bool {
        guard validate() else{
            return false
        }
        let toDo = ToDoListItem(title: title, description: description, date: date, isCompleted: false)
        do{
            try await updateDatabase(toDo: toDo)
        }
        catch{
            print("Could not update the Database.")
        }
        
        return true
    }
    
    func updateDatabase(toDo : ToDoListItem) async throws{
        guard currentUserId != nil else {
            errorMessage = "Could not find the user id."
            showingError = true
            return
        }

        try db
            .collection("users")
            .document(currentUserId!)
            .collection("todos")
            .addDocument(from: toDo.self)
        
        print("ToDo created successfully.")
    }
}
