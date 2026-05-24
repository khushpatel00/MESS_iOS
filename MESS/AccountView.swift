//
//  AccountView.swift
//  MESS
//
//  Created by khush on 21/05/2026.
//

import SwiftUI

struct AccountView: View {
    
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    NavigationLink {
                        AccountEditView()
                            .navigationTitle("My Account")
                    } label: {
                        HStack {
                            Image("userpreview")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 70)
                                .clipShape(.capsule)
                            Text("Raj Surani")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(Color("ThemedText"))
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("ThemedGray"))
                        .clipShape(.capsule)
                        .padding()
                    }
                    // MARK: Group Container
                    ScrollView () {
                        // MARK: Group 1
                        VStack (alignment: .leading ,spacing: .zero) {
                            // MARK: Account
                            NavigationLink {
                                VStack {
                                    AccountEditView()
                                }
                                .navigationTitle("My Account")
                                .navigationBarTitleDisplayMode(.large)
                            } label: {
                                HStack{
                                    Image(systemName: "person.crop.circle")
                                    Text("Account")
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(.ultraThinMaterial)
                                .font(.title3)
                                .foregroundStyle(Color("ThemedText"))
                            }
                            NavigationLink {
                                VStack {
                                    Text("Coming Soon!")
                                }
                                .navigationTitle("Privacy")
                                .navigationBarTitleDisplayMode(.large)
                            } label: {
                                HStack {
                                    Image(systemName: "key")
                                    Text("Privacy")
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(.ultraThinMaterial)
                                .font(.title3)
                                .foregroundStyle(Color("ThemedText"))
                            }
                            NavigationLink {
                                VStack {
                                    Text("Coming Soon!")
                                }
                                .navigationTitle("Chats")
                                .navigationBarTitleDisplayMode(.large)
                            } label: {
                                HStack {
                                    Image(systemName: "message")
                                    Text("Chats")
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(.ultraThinMaterial)
                                .font(.title3)
                                .foregroundStyle(Color("ThemedText"))
                            }
                            NavigationLink {
                                VStack {
                                    Text("Coming Soon!")
                                }
                                .navigationTitle("Notifications")
                                .navigationBarTitleDisplayMode(.large)
                            } label: {
                                HStack {
                                    Image(systemName: "bell.badge")
                                    Text("Notifications")
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(.ultraThinMaterial)
                                .font(.title3)
                                .foregroundStyle(Color("ThemedText"))
                            }
                        }
                        
                        // MARK: Group 2
                        VStack {
                            NavigationLink {
                                VStack {
                                    Text("Coming Soon!")
                                }
                                .navigationTitle("Chat History")
                                .navigationBarTitleDisplayMode(.large)
                            } label: {
                                HStack {
                                    Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                                    Text("Chat History")
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(.ultraThinMaterial)
                                .font(.title3)
                                .foregroundStyle(Color("ThemedText"))
                            }
                        }
                        
                        
                        // MARK: Group 3
                        VStack {
                            NavigationLink {
                                VStack {
                                    Text("Coming Soon!")
                                }
                                .navigationTitle("Help & feedback")
                                .navigationBarTitleDisplayMode(.large)
                            } label: {
                                HStack {
                                    Image(systemName: "questionmark.circle")
                                    Text("Help & feedback")
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(.ultraThinMaterial)
                                .font(.title3)
                                .foregroundStyle(Color("ThemedText"))
                            }
                        }
                    }
                    .background(Color("Background"))
                    .cornerRadius(24, corners: [.topLeft, .topRight])
                    .background(LinearGradient(colors: [.clear, Color("Background")], startPoint: .top, endPoint: .bottom))
                }
                .navigationTitle("Account")
            }
            .navigationBarBackButtonHidden(true)
            
            //            VStack {
            //                Text("~ From MESS")
            //                    .font(.title3)
            //                    .bold()
            //                HStack {
            //                    Button("MESS for Android") {
            //
            //                    }
            //                    Button("MESS for Web") {
            //
            //                    }
            //                }
            //
            //            }
        }
        .background(Color("Background"))
    }
}


struct AccountEditView: View {
    
    @State fileprivate var isLoggingOut: Bool = false
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = true
    
    @State private var username: String = "Raj Surani"
    var body: some View {
        ScrollView {
            HStack (alignment: .bottom) {
                Image("userpreview")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 400)
                    .clipShape(.capsule)
                    .padding()
                Image(systemName: "square.and.pencil")
                    .offset(x: -90, y: -20)
                    .imageScale(.large)
            }
            .padding()
            TextField("username", text: $username)
                .padding()
                .background(Color("ThemedGray"))
                .clipShape(.capsule)
                .padding()
            
            
            
            Button(action: {  }) {
                Text("Forgot Password?")
            }
            
            
            Button(action: { isLoggingOut = true }){
                Text("Log Out")
                    .foregroundStyle(.red)
                    .padding()
                    .padding(.horizontal)
                    .background(.ultraThinMaterial)
                    .clipShape(.capsule)
            }.alert("Log Out", isPresented: $isLoggingOut) {
                Button("Confirm", role: .destructive) {
                    withAnimation {
                        KeychainManager.shared.deleteToken()
                        hasCompletedOnboarding = false
                    }
                }
            }
        }
    }
}


#Preview {
    AccountView()
}
