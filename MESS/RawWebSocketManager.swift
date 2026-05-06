//
//  WebSocketManager.swift
//  MESS
//
//  Created by khush on 06/05/2026.
//

import Foundation

class RawWebSocketManager: NSObject, ObservableObject, URLSessionWebSocketDelegate {
    
    var webSocket: URLSessionWebSocketTask?
    var session: URLSession!
    
    
    override init() {
        super.init()
        session = URLSession(
            configuration: .default,
            delegate: self,
            delegateQueue: OperationQueue()
        )
        
        
        let url = URL(string: "ws://192.168.1.28:8080")!
        
        webSocket = session.webSocketTask(with: url)
    }
    
    func connect() {
        webSocket?.resume()
        receive()
    }
    
    func send(message: String) {
        webSocket?.send(.string(message)) {error in
            if let error = error {
                print("Send Error:", error)
            }
        }
    }
    
    func receive() {
        webSocket?.receive { [weak self] result in
            switch result {
                case .failure(let error):
                    print("Receive Error:", error)
                case .success(let message):
                    switch message {
                    case .string(let text):
                        print("Received:", text)
                    case .data(let data):
                        print("Received data:", data)
                    @unknown default:
                        break
                    }
                    self?.receive()
            }
        }
    }
    
    
    func disconnect() {
        webSocket?.cancel(with: .goingAway, reason: nil)
    }
    
    // Delegate Methods
    
    func urlSession (
        _ session: URLSession,
        webSocketTask: URLSessionWebSocketTask,
        didOpenWithProtocol protocol: String?
    ) {
        print("Connected")
    }
    
    func urlSession(
        _ session: URLSession,
        webSocketTask: URLSessionWebSocketTask,
        didCloseWith closeCode: URLSessionWebSocketTask.CloseCode,
        reason: Data?
    ) {
        print("Disconnect")
    }
}
