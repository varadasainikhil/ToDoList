//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import FirebaseAuth
import Foundation

@Observable
class MainViewViewModel {
    var currentUserId : String = ""
    var isSignedIn : Bool = false
    private var handler : AuthStateDidChangeListenerHandle? = nil
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{ auth, user in
            self.currentUserId = user?.uid ?? ""
            self.isSignedIn = user != nil
        }
    }
}
