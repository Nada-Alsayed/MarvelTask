//
//  HomeModel.swift
//  Marvel
//
//  Created by MAC on 24/11/2023.
//

import Foundation

// MARK: - Response
class Response: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    var data: DataClass?
}

// MARK: - DataClass
class DataClass: Codable {
    let offset, limit, total, count: Int?
    var results: [Result]?
}

// MARK: - Movie
class Result: Codable {
    var id, digitalID: Int?
    var title: String?
    let issueNumber: Int?
    var variantDescription, description, modified, isbn: String?
    let upc, diamondCode, ean, issn: String?
    var format: String?
    let pageCount: Int?
    let resourceURI: String?
    var creators: Creators?
    var thumbnail: Thumbnail?
    var prices: [Price]?
    init(id: Int? = nil,
             digitalID: Int? = nil,
             title: String? = nil,
             issueNumber: Int? = nil,
             variantDescription: String? = nil,
             description: String? = nil,
             modified: String? = nil,
             isbn: String? = nil,
             upc: String? = nil,
             diamondCode: String? = nil,
             ean: String? = nil,
             issn: String? = nil,
             format: String? = nil,
             pageCount: Int? = nil,
             resourceURI: String? = nil,
             creators: Creators? = nil,
             thumbnail: Thumbnail? = nil,
             prices: [Price]? = nil) {
            
            self.id = id
            self.digitalID = digitalID
            self.title = title
            self.issueNumber = issueNumber
            self.variantDescription = variantDescription
            self.description = description
            self.modified = modified
            self.isbn = isbn
            self.upc = upc
            self.diamondCode = diamondCode
            self.ean = ean
            self.issn = issn
            self.format = format
            self.pageCount = pageCount
            self.resourceURI = resourceURI
            self.creators = creators
            self.thumbnail = thumbnail
            self.prices = prices
        }
}

// MARK: - Thumbnail
class Thumbnail: Codable {
    var path: String?
    let thumbnailExtension: Extension?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - Price
class Price: Codable {
    let type: String?
    var price: Double?
}

// MARK: - Extension
enum Extension: String, Codable {
    case jpg = "jpg"
}

// MARK: - Creators
class Creators: Codable {
    let available: Int?
    let collectionURI: String?
    var items: [CreatorsItem]?
    let returned: Int?
}

// MARK: - CreatorsItem
class CreatorsItem: Codable {
    let resourceURI: String?
    var name, role: String?
}
