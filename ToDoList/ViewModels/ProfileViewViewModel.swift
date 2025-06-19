//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import FirebaseAuth
import Foundation

@Observable
class ProfileViewViewModel{
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
}
