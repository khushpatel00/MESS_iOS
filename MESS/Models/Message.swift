//
//  Message.swift
//  MESS
//
//  Created by khush on 30/04/2026.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var message: String
    var isSent: Bool
    var timeStamp: Date
}
