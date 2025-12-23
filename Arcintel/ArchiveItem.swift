//
//  ArchiveItem.swift
//  Arcintel
//
//  Created by Claudia&Gabe  on 12/23/25.
//

import Foundation
import SwiftData

@Model
final class ArchiveItem {
    var timestamp: Date
    var title: String
    var content: String
    var sourceUrl: String?
    var isFavorite: Bool
    
    init (title: String, content: String, sourceUrl: String? = nil, isFavorite: Bool = false) {
        self.timestamp = Date()
        self.title = title
        self.content = content
        self.sourceUrl = sourceUrl
        self.isFavorite = isFavorite
    }
}
