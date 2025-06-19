//
//  SignUpView.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import SwiftUI

struct SignUpView: View {
    @State var viewModel = SignupViewViewModel()
    
    var body: some View {
        VStack{
            // Header
            HeaderView(titleText: "Register", subText: "Start organizing ToDos", color: Color(red: 42/255, green: 52/255, blue: 57/255))
            
            Spacer()
            
            // SignUp Form
            VStack{
                
                TextField("Enter Full Name", text: $viewModel.name)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .foregroundStyle(Color(red: 21/255, green: 26/255, blue: 28/255))
                
                TextField("Enter Email", text: $viewModel.email)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .padding(.bottom)
                    .foregroundStyle(Color(red: 21/255, green: 26/255, blue: 28/255))
                
                SecureField("Enter Password", text: $viewModel.password)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                TLButtonView(title: "Sign Up", backgroundColor: Color(red: 42/255, green: 52/255, blue: 57/255)){
                    // Attempt Sign Up
                    viewModel.signUp()
                    }
                .frame(width: 250, height: 45)
                .padding(.top)
                
                Spacer()
            }
            .frame(width: 400, height: 300)
            
            Spacer()
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SignUpView()
}
