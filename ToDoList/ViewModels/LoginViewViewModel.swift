//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import FirebaseAuth
import Foundation

@Observable
class LoginViewViewModel {
    var email = ""
    var password = ""
    var errorMessage = ""
    var showingAlert = false
    
    init(){
        
    }

    func login() {
        guard validate() else {
            //
            return
        }
        // Logging in
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            guard error != nil else {
                self.errorMessage = error!.localizedDescription
                return
            }
            
        }
        
    }

    
    func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
            errorMessage = "Email field is empty."
            showingAlert = true
            return false
        }
        
        guard !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
            errorMessage = "Password field is empty."
            showingAlert = true
            return false
        }
        
        guard self.email.contains("@") && self.email.contains(".") else{
            errorMessage = "Please enter a valid Email address."
            showingAlert = true
            return false
        }
        
        guard self.password.trimmingCharacters(in: .whitespacesAndNewlines).count >= 6 else{
            errorMessage = "Password should be atleast 6 characters long."
            showingAlert = true
            return false
        }
        
        return true
    }
}
