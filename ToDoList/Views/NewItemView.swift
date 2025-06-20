//
//  NewItemView.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import SwiftUI

struct NewItemView: View {
    @State var viewModel = NewItemViewViewModel()
    var body: some View {
        NavigationStack{
            VStack{
            }
            .navigationTitle("Add a new Task")
        }
    }
}

#Preview {
    NewItemView()
}
