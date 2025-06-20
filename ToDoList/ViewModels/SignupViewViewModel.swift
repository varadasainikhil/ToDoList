//
//  SignupViewViewModel.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

@Observable
class SignupViewViewModel{
    var name = ""
    var email = ""
    var password = ""
    var errorMessage = ""
    
    init(){
        
    }
    
    func signUp(){
        guard validate() else{
            return
        }
        
        // Signing up Users
        Auth.auth().createUser(withEmail: email, password: password){result, error in
            guard error == nil else{
                self.errorMessage = error?.localizedDescription ?? "Error Unknown"
                print(error?.localizedDescription ?? "")
                return
            }
            print("User with user id \(result!.user.uid) created successfully.")
            guard let userId = result?.user.uid else {
                return
            }
            self.insertUserRecord(id: userId)
        }
    
    }
    
    private func validate() -> Bool{
        guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            errorMessage = "Please fill all fields."
            return false
        }
        
        guard email.contains("@"), email.contains(".") else{
            errorMessage = "Please enter a valid email."
            return false
        }
        
        guard password.trimmingCharacters(in: .whitespacesAndNewlines).count >= 6 else{
            errorMessage = "Password must be atleast 6 characters long."
            return false
        }
        return true
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id, name: name, joinDate: Date.now, email: email)
        let db = Firestore.firestore()
        do{
            try db.collection("users").document(id).setData(from: newUser)
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
}
