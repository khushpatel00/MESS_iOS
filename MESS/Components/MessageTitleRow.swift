//
//  MessageTitleRow.swift
//  MESS
//
//  Created by khush on 08/05/2026.
//

import SwiftUI

struct MessageTitleRow: View {
    
    var username: String
    var isConnected: Bool = false
    var body: some View {
        HStack(spacing: 15){
            Image("ProfileSamPorter")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(.circle)
            VStack(alignment: .leading){
                Text(username)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(Color("ThemedText"))
                Text("Online")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            ZStack{
                Image(systemName: "phone.fill")
                    .foregroundStyle(.gray)
                    .clipShape(.circle)
//                  .frame(width: 50, height: 50)
                    .padding(10)
                    .background(.white)
                    .clipShape(.circle)
                
                    Circle()
                    .fill(isConnected ? .green : Color.red.opacity(0.5))
                        .frame(width: 10, height: 10)
                        .offset(x: 20 ,y: -20)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .navigationTitle(username)
    }
}

#Preview {
    MessageTitleRow(username: "Hideo Kojima", isConnected: true)
}
