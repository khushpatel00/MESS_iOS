//
//  MessageBubble 2.swift
//  MESS
//
//  Created by khush on 12/05/2026.
//


//
//  MessageBubble.swift
//  MESS
//
//  Created by khush on 30/04/2026.
//

import SwiftUI

struct BroadcastMessageBubble: View {
    var message: Message
    var displayName: String?
    @State private var showTime = false
    var body: some View {
        VStack (alignment: message.isSent ? .trailing : .leading) {
            VStack(alignment: message.isSent ? .trailing : .leading){
                if displayName != nil { // same as `if displayName is String`
                    Text(displayName!)
                        .foregroundStyle(.gray)
                        .padding(.leading)
                        .offset(y: 10)
                        .font(.subheadline)
                }
                Text(message.message)
                    .padding()
                    .background(Color(message.isSent ? "Theme" : "ThemedGray"))
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300, alignment: message.isSent ? .trailing : .leading)
            .onTapGesture{
                withAnimation{
                    showTime.toggle()
                }
            }
            
            if showTime {
                Text("\(message.timeStamp.formatted(.dateTime.hour().minute()))")
                    .foregroundStyle(.gray)
                    .padding(.horizontal)
                    .font(.caption)
                    .transition(.opacity.combined(with: .opacity))
            }
        }
        .frame(maxWidth: .infinity, alignment: message.isSent ? .trailing : .leading)
        .padding(message.isSent ? .trailing : .leading)
    }
}

#Preview {
    BroadcastMessageBubble(message: Message(id: "12345", message: "This is a message block, that is being used just for the testing purposes only !!!", isSent: false, timeStamp: Date()), displayName: "Sam")
    BroadcastMessageBubble(message: Message(id: "12345", message: "Glad, I Didn't knew that !!!", isSent: true, timeStamp: Date()), displayName: nil)
}
