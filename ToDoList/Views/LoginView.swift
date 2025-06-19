//
//  LoginView.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import SwiftUI

struct LoginView: View {
    @State var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                // Header
                HeaderView(titleText: "To Do List", subText: "Get Things Done", color: Color(red: 31/255, green: 38/255, blue: 42/255))
                
                Spacer()
                
                // Login Form
                VStack{
                    TextField("Enter Email", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .foregroundStyle(Color(red: 21/255, green: 26/255, blue: 28/255))
                    
                    SecureField("Enter Password", text: $viewModel.password)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .padding(.bottom)
                    
                    TLButtonView(title: "Log In", backgroundColor:Color(red: 21/255, green: 26/255, blue: 28/255) , action: {
                        // Attempt Log In
                        viewModel.login()
                    })
                    .frame(width: 250, height: 45)
                    .padding(.top)
                    
                    Spacer()
                }
                .frame(width: 400, height: 300)
                
                Spacer()
                
                // Create Account
                VStack{
                    Text("New Around here?")
                    
                    NavigationLink("Create An Account", destination: SignUpView())
                }
                Spacer()
            }
            .ignoresSafeArea()
        }
        .alert("Error", isPresented: $viewModel.showingAlert) {
            // Nothing
        } message: {
            Text(viewModel.errorMessage)
        }

    }
}

#Preview {
    LoginView()
}
