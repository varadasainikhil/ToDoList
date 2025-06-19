//
//  ContentView.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import FirebaseAuth
import SwiftUI

struct MainView: View {
    @State var viewModel = MainViewViewModel()
    
    var body: some View {
        NavigationStack{
            if viewModel.isSignedIn{
                TabView {
                    Tab("Home", systemImage: "house") {
                        ToDoListView(userId : viewModel.currentUserId)
                    }
                    
                    Tab("Account", systemImage: "person") {
                        ProfileView(userId : viewModel.currentUserId)
                    }
                }
                
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    MainView()
}
