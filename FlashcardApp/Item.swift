//
//  Item.swift
//  FlashcardApp
//
//  Created by Cristian Cretu on 27.11.2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
