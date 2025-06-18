//
//  TLButtonView.swift
//  ToDoList
//
//  Created by Sai Nikhil Varada on 6/18/25.
//

import SwiftUI

struct TLButtonView: View {
    let title : String
    let backgroundColor : Color
    let action : ()-> Void
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundStyle(backgroundColor)
                
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButtonView(title: "Log In", backgroundColor: Color(red: 21/255, green: 26/255, blue: 28/255)) {
        //
    }
}
