//
//  LocalMovie.swift
//  Marvel
//
//  Created by MAC on 25/11/2023.
//

import Foundation

struct LocalMovie{
    var title:String?
    var movieImg:String?
    var format:String?
    var price:Double?
    var creatorName:String?
    var creatorRole:String?
    var id : Int?
    
    func convertRemoteModelToLocalModel(remoteMovie: Result) -> LocalMovie {
        let imageURL = "\(remoteMovie.thumbnail?.path ?? "").\(remoteMovie.thumbnail?.thumbnailExtension?.rawValue ?? "")"

        var price: Double = 0.0
        if let firstPrice = remoteMovie.prices?.first {
            price = firstPrice.price ?? 0.0
        }

        var creatorName = "Not Available"
        var creatorRole = "Not Available"
        if let firstCreator = remoteMovie.creators?.items?.first {
            creatorName = firstCreator.name ?? "Not Available"
            creatorRole = firstCreator.role ?? "Not Available"
        }

        let localMovie = LocalMovie(
            title: remoteMovie.title,
            movieImg: imageURL,
            format: remoteMovie.format,
            price: price,
            creatorName: creatorName,
            creatorRole: creatorRole,
            id: remoteMovie.id
        )

        return localMovie
    }

    
}
