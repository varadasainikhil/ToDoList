//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

@Observable
class ToDoListViewViewModel {
    var showingSheet = false
    private let db = Firestore.firestore()
    
    init(){
        
    }
    
    func deleteToDoListItem(documentId : String) async {
        
        let userId = Auth.auth().currentUser?.uid
        guard userId != nil else{
            print("user id is not found.")
            return
        }
        do{
            print("User id : \(userId ?? "user id not found.")")
            try await db.collection("users").document(userId!).collection("todos").document(documentId).delete()
            print("The todo with id: \(documentId) is deleted.")
        }
        catch{
            print(error.localizedDescription)
        }
    }
}
