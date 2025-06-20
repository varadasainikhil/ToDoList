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
    
    init(){}
    
    func markIsCompleted(toDoId : String) async{
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let docRef = db.collection("users").document(userId).collection("todos").document(toDoId)
        
        do{
            let document = try await docRef.getDocument()
            if document.exists{
                
                let tempToDo = try document.data(as: ToDoListItem.self)
                try await docRef.updateData(["isCompleted":tempToDo.isCompleted == true ? false : true])
                
            }
        }
        catch{
            print(error.localizedDescription)
        }
        
        
        
        print("ToDo marked completed successfully.")
    }
}
