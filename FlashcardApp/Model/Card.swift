//
//  Card.swift
//  FlashcardApp
//
//  Created by Cristian Cretu on 30.11.2023.
//

import Foundation
import SwiftData

@Model
final class Card {
    @Attribute(.unique)
    var id: UUID
    var front: String
    var back: String
    
    var tags: [Tag]?
    
    
    init(id: UUID, front: String, back: String) {
        self.id = id
        self.front = front
        self.back = back
    }
}
