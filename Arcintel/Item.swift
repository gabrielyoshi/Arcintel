//
//  Item.swift
//  Arcintel
//
//  Created by Claudia&Gabe  on 12/23/25.
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
