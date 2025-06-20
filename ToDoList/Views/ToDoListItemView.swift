//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListItemView: View {
    let toDo : ToDoListItem
    @State var viewModel = ToDoListItemViewViewModel()
    @State var imageName = "seal"
    var body: some View {
        VStack(alignment: .leading){
            Text("Due on \(toDo.date.formatted(date: .abbreviated, time: .shortened))")
                
            HStack{
                VStack(alignment: .leading){
                    Text(toDo.title)
                        .font(.title.bold())
                    if !toDo.description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                        Text(toDo.description)
                    }
                }
                Spacer()
                
                Image(systemName: toDo.isCompleted ? "checkmark.seal" : "seal")
                    .onTapGesture {
                        Task{
                            await viewModel.markIsCompleted(toDoId: toDo.id!)
                        }
                    }
                    .font(.title)

            }
        }
    }
}

#Preview {
    ToDoListItemView(toDo: ToDoListItem(title: "Test Title", description: "Test Description", date: Date.now.addingTimeInterval(86400*3), isCompleted: true))
}
