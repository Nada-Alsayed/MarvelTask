//
//  HomeModel.swift
//  Marvel
//
//  Created by MAC on 24/11/2023.
//

import Foundation

// MARK: - Response
struct Response: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id, digitalID: Int
    let title: String
    let issueNumber: Int
    let variantDescription, description, modified, isbn: String
    let upc, diamondCode, ean, issn: String
    let format: String
    let pageCount: Int
    let resourceURI: String
    let thumbnail: Thumbnail
    let prices: [Price]
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - Price
struct Price: Codable {
    let type: String
    let price: Double
}

// MARK: - Extension
enum Extension: String, Codable {
    case jpg = "jpg"
}
