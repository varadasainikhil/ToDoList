//
//  HeaderView.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/17/25.
//

import SwiftUI

struct HeaderView: View {
    var titleText : String
    var subText : String
    var color : Color = Color(.blue)
    
    var body: some View {
        GeometryReader{geometry in
            ZStack{
                Rectangle()
                    .foregroundStyle(color)
                    .frame(width: geometry.size.width, height: 250)
                
                VStack{
                    Spacer()
                    Spacer()
                    Text(titleText)
                        .font(.system(size: 50))
                        .foregroundStyle(.white)
                        .bold()
                        
                    Text(subText)
                        .font(.system(size: 30))
                        .foregroundStyle(.white)
                    Spacer()
                }
            }
        }
        .frame(height: 250)
    }
}

#Preview {
    HeaderView(titleText: "To Do List", subText: "Get things Done", color: Color(red: 31/255, green: 38/255, blue: 42/255))
}
