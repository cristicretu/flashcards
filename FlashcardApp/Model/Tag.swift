//
//  Tag.swift
//  FlashcardApp
//
//  Created by Cristian Cretu on 30.11.2023.
//

import Foundation
import SwiftData

@Model
final class Tag {
    var name: String
    
    var cards: [Card]?
    
    init(name: String) {
        self.name = name
    }
}
