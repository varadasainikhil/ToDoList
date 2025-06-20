//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @State var viewModel = ToDoListViewViewModel()
    private let userId : String
    @FirestoreQuery var toDoArray : [ToDoListItem]
    
    init(userId:String){
        self.userId = userId
        self._toDoArray = FirestoreQuery(collectionPath: "users/\(userId)/todos", predicates: [.orderBy("date", false)])
    }
    
    var body: some View {
        NavigationStack{
            List(toDoArray){toDo in
                ToDoListItemView(toDo: toDo)
                    .swipeActions {
                        Button("Delete", role: .destructive){
                            Task{
                                await viewModel.deleteToDoListItem(documentId: toDo.id ?? "")
                            }
                        }
                    }
            }
            .navigationTitle("To Do List")
            .sheet(isPresented: $viewModel.showingSheet) {
                NewItemView()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showingSheet = true
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "yqWUeuWSCyUAEjUS7GE0mLIyd9h1")
}

//TODO: 1. Implement swipe to delete functionality for ToDos
//TODO: 2. Implement the ordering and filtering for ToDos, completed ToDos must be filtered first and then the incompleted ones.
