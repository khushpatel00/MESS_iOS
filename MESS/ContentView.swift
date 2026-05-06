//
//  ContentView.swift
//  MESS
//
//  Created by khush on 27/04/2026.
//

import SwiftUI

struct ContentView: View {
    
    
//    @StateObject var socket = RawWebSocketManager()
    @StateObject private var socket = WebSocketManager()
    @State private var messageInput = "Hiee !"
    @State private var keyboardHeight: CGFloat = 0
    @FocusState private var focus: Bool
    
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
            .safeAreaInset(edge: .bottom) {
//                VStack {
                    HStack {
                        TextField("Message", text: $messageInput)
                            .focused($focus)
                            .padding() // between the text and inputbox
                            .background()
                            .clipShape(.capsule)
                            .padding([.vertical, .leading])
                        //                      .textFieldStyle(.roundedBorder)
                        
                        VStack {
                            HStack{
                                Button(action: {
                                    socket.connect()
                                }){
                                   Image(systemName: "link")
                                        .padding()
                                        .background()
                                        .clipShape(.capsule)
                                }
                                Button(action: {
                                    socket.send(message: "Hello from iOS implementation of MESS app")
                                }) {
                                    Image(systemName: "paperplane.fill")
                                        .padding()
                                        .background()
                                        .clipShape(.capsule)
                                }
                            }
                        }
//                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding([.vertical, .trailing])
                        .background(Color("Background"))
                    }
                    .padding(.vertical, 10)
                    .padding(.bottom, keyboardHeight)
                    .animation(.easeOut(duration: 0.25), value: keyboardHeight)
//                }
            }
            .background(Color("Background"))
            .cornerRadius(30, corners: [.topLeft, .topRight])
        }
        .onAppear {
            KeyboardObserver()
        }
        .ignoresSafeArea(edges: .bottom) // for keeping the experience more better
        .background(Color("Theme"))
    }
    
    func KeyboardObserver() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: .main
        ) { notification in
            if let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect{
                keyboardHeight = frame.height
            }
        }
        
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: .main
        ) { _ in
            keyboardHeight = 0
        }
    }
}

#Preview {
    ContentView()
}
