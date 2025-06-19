//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

@Observable
class ProfileViewViewModel{
    let db = Firestore.firestore()
    var currentUser : User?
    init(){
        
    }
    
    func logOut(){
        do{
            try Auth.auth().signOut()
        }
        catch{
            print("User cannot be signed out.")
            print(error.localizedDescription)
        }
        
    }
    
    func getUserInfo(userId : String) async throws{
        let docRef = db.collection("users").document(userId)
        let user = try await docRef.getDocument(as: User.self)
        print("User with name \(user.name) has been retrieved.")
        currentUser = user
    }
}
