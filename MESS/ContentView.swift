//
//  ContentView.swift
//  MESS
//
//  Created by khush on 07/05/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                NavigationLink {
                    ChatView(username: "Hideo Kojima")
                } label: {
                    TitleRow(username: "Hideo Kojima" , isConnected: true)
                        .background(.ultraThinMaterial)
//                        .clipShape(.capsule)
//                        .padding(.horizontal)
                }
                .navigationTitle("Chats")
                NavigationLink {
                    ChatView(username: "Sam")
                } label: {
                    TitleRow(username: "Sam" , isConnected: true)
                        .background(.ultraThinMaterial)
//                        .clipShape(.capsule)
//                        .padding(.horizontal)
                }
                NavigationLink {
                    ChatView(username: "Fragile")
                } label: {
                    TitleRow(username: "Fragile" , isConnected: true)
                        .background(.ultraThinMaterial)
//                        .clipShape(.capsule)
//                        .padding(.horizontal)
                }
                NavigationLink {
                    ChatView(username: "Higgs")
                } label: {
                    TitleRow(username: "Higgs" , isConnected: true)
                        .background(.ultraThinMaterial)
//                        .clipShape(.capsule)
//                        .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
