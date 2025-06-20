//
//  NewItemView.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import SwiftUI

struct NewItemView: View {
    @Environment(\.dismiss) var dismiss
    @State var viewModel = NewItemViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Form{
                    TextField("Enter the Task To Do", text: $viewModel.title)
                        .font(.subheadline)
                        .padding(.bottom)
                    
                    TextField("Description of the Task To Do", text: $viewModel.description)
                        .font(.subheadline)
                        .padding(.bottom)
                    
                    DatePicker("Date and Time", selection: $viewModel.date, in: Date()..., displayedComponents: [.date,.hourAndMinute])
                        .datePickerStyle(.graphical)
                    
                    TLButtonView(title: "Save", backgroundColor: Color(red: 42/255, green: 52/255, blue: 57/255)) {
                        Task{
                            if await viewModel.createToDoListItem(){
                                dismiss()
                            }
                        }
                    }
                    .frame(width: 350, height: 45,alignment: .center)
                }
                
            }
            .navigationTitle("Add a new Task")
            .alert("Error", isPresented: $viewModel.showingError) {
                // No action
            } message: {
                Text(viewModel.errorMessage)
            }

        }
    }
}

#Preview {
    NewItemView()
}
