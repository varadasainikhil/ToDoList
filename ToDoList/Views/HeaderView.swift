//
//  HeaderView.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Rectangle()
                    .foregroundStyle(Color(red: 21/255, green: 26/255, blue: 28/255))
                    .frame(width: geometry.size.width, height: 250)
                
                VStack{
                    
                    Text("To Do List")
                        .font(.system(size: 50))
                        .foregroundStyle(.white)
                        .bold()
                    
                    Text("Get things Done")
                        .font(.system(size: 30))
                        .foregroundStyle(.white)
                }
                
            }
        }
        .frame(height: 250)
    }
}

#Preview {
    HeaderView()
}
