//
//  ArticlesData.swift
//  Articles
//
//  Created by Massimo Montanaro on 18/11/24.
//

import Foundation
import SwiftData

@Model
class Article {
    static var currentID: Int = 0
    
    var id: Int
    var createdAt: Date
    var title: String
    var summary: String
    var author: String
    var imagePath: String
    var content: String
    
    init(title: String = "", summary: String = "", author: String = "", imagePath: String = "", content: String = "") {
        self.id = Article.incrementID()
        self.createdAt = .now
        self.title = title
        self.summary = summary
        self.author = author
        self.imagePath = imagePath
        self.content = content
    }
    
    private static func incrementID() -> Int {
        currentID += 1
        return currentID
    }
}
