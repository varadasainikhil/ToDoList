//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import SwiftUI

struct ToDoListView: View {
    @State var viewModel = ToDoListViewViewModel()
    private let userId : String
    
    init(userId:String){
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Hello World")
            }
            .toolbar {
                Button{
                    //Action
                    viewModel.showingSheet = true
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
            .navigationTitle("To Do List")
            .sheet(isPresented: $viewModel.showingSheet) {
                NewItemView()
            }
            
        }
    }
}
#Preview {
    ToDoListView(userId: "TestUserId")
}
