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
                Spacer()
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                
                Spacer()
                Text("Name : \(viewModel.currentUser?.name ?? "Loading user data.")")
                Text("Email : \(viewModel.currentUser?.email ?? "Loading user data.")")
                if viewModel.currentUser != nil{
                    Text("Joined : \(viewModel.currentUser!.joinDate.formatted(date: .complete, time: .omitted))")
                }
                else{
                    Text("joinedAt : Loading user data.")

                }
                
                
                
                
                Spacer()
                TLButtonView(title: "Log Out", backgroundColor: Color(red: 21/255, green: 26/255, blue: 28/255)) {
                    // Log Out Functionality
                    viewModel.logOut()
                }
                .frame(width: 250, height: 45)
                Spacer()
            }
            .navigationTitle("Account")
            .onAppear {
                Task{
                    do{
                        try await viewModel.getUserInfo(userId: userId)
                    }
                    catch{
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView(userId: "TestUserId")
}
