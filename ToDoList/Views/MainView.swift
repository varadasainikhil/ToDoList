//
//  ContentView.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import FirebaseAuth
import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack{
            LoginView()
        }
        
    }
}

#Preview {
    MainView()
}
