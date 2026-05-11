//
//  MessageArray.swift
//  MESS
//
//  Created by khush on 12/05/2026.
//

import Foundation

struct MessageArray : Identifiable, Codable, Hashable {
    var id: String?
    var message: String
    var isSent: Bool
    var displayName: String
}
