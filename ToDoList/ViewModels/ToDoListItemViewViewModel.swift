//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

@Observable
class ToDoListItemViewViewModel{
    private let db = Firestore.firestore()
    init(){
    
    }
    
    func getUserId() -> String{
        guard let userId = Auth.auth().currentUser?.uid else {
            return ""
        }
        return userId
    }
    
    func getToDo(toDoId : String) async -> ToDoListItem?{
        let userId = getUserId()
        
        let docRef = db.collection("users").document(userId).collection("todos").document(toDoId)
        
        do{
            let document = try await docRef.getDocument()
            if document.exists{
                
                let tempToDo = try document.data(as: ToDoListItem.self)
                return tempToDo
            }
        }
        catch{
            print(error.localizedDescription)
        }
        return nil
    }
    
    func markIsCompleted(toDoId : String) async{
        
        do{
            let userId = getUserId()
            let tempToDo = await getToDo(toDoId: toDoId)
            guard tempToDo != nil else{
                print("Cannot fetch ToDo Object.")
                return
            }
            let docRef = db.collection("users").document(userId).collection("todos").document(toDoId)
            try await docRef.updateData(["isCompleted":tempToDo!.isCompleted == true ? false : true])
        }
        catch{
            print(error.localizedDescription)
        }
        print("ToDo is marked completed or incomplete.")
    }
}
