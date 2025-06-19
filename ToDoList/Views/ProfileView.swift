//
//  ProfileView.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import SwiftUI

struct ProfileView: View {
    var viewModel = ProfileViewViewModel()
    private var userId : String
    
    init(userId : String){
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Hello World")
            }
            .navigationTitle("Account")
        }
    }
}

#Preview {
    ProfileView(userId: "TestUserId")
}
