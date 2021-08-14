// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let news = try? newJSONDecoder().decode(News.self, from: jsonData)

import Foundation

// MARK: - News
struct News: Codable {
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article]?
    
}

// MARK: - Article
struct Article: Codable {
    var source: Source?
    var author: String?
    var title:String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
