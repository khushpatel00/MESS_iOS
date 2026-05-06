//
//  SocketManager.swift
//  MESS
//
//  Created by khush on 06/05/2026.
//

import Foundation
import SocketIO

class WebSocketManager: ObservableObject {

    var manager: SocketManager!
    var socket: SocketIOClient!

    init() {

        manager = SocketManager(
            socketURL: URL(string: "http://192.168.1.28:8080")!,
            config: [
                .log(true),
                .compress,
                .forceWebsockets(true)
            ]
        )

        socket = manager.defaultSocket

        setupListeners()
    }

    func connect() {
        socket.connect()
    }

    func disconnect() {
        socket.disconnect()
    }

    func send(message: String) {

        socket.emit("send-message", [
            "message": message
        ])
    }

    func setupListeners() {

        socket.on(clientEvent: .connect) { data, ack in
            print("Connected to server")
        }

        socket.on(clientEvent: .disconnect) { data, ack in
            print("Disconnected")
        }

        socket.on("message") { data, ack in
            print("Message received:", data)
        }
    }
}
