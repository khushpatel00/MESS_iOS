//
//  AccountView.swift
//  MESS
//
//  Created by khush on 21/05/2026.
//

import SwiftUI

struct AccountView: View {
    
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = true
    @State private var isLoggingOut: Bool = false
    var body: some View {
        VStack {
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
        .navigationTitle("Account")
        
    }
}

#Preview {
    AccountView()
}
