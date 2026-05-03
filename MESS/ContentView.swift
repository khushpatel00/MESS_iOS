//
//  ContentView.swift
//  MESS
//
//  Created by khush on 27/04/2026.
//

import SwiftUI

struct ContentView: View {
    var messageArray = ["Hi There !!", "How you're doin",  "Im glad, we could talk to you on a Private Server, where no one could read our conversations directly"]
    var body: some View {
        VStack(alignment: .center) {
            TitleRow()
            ScrollView{
                ForEach(messageArray, id: \.self) { text in
                    MessageBubble(message: Message(id: "12345", message: text, isSent: false, timeStamp: Date()))
                }
                .padding(.top, 20)
                
            }
            .background(Color("Background"))
            .cornerRadius(30, corners: [.topLeft, .topRight])
            .shadow(color: Color(UIColor(white: 0, alpha: 0.35)), radius: 20)
        }
        .background(Color("Theme"))
        .ignoresSafeArea(edges: .bottom) // for keeping the experience more better
    }
}

#Preview {
    ContentView()
}
