//
//  TitleRow.swift
//  MESS
//
//  Created by khush on 28/04/2026.
//

import SwiftUI

struct TitleRow: View {

    var userName = "Sam Porter"
    
    var body: some View {
        HStack(spacing: 20){
            Image("ProfileSamPorter")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(.circle)
            VStack(alignment: .leading){
                Text(userName)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                
                Text("Online")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Image(systemName: "phone.fill")
                .foregroundStyle(.gray)
                .clipShape(.circle)
//                .frame(width: 50, height: 50)
                .padding(10)
                .background(.white)
                .clipShape(.circle)
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        
    }
}

#Preview {
    TitleRow()
        .background(Color("Theme"))
        .clipShape(.capsule)
        .padding()
}
