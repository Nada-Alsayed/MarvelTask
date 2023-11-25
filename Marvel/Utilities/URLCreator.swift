//
//  URLCreator.swift
//  Marvel
//
//  Created by MAC on 24/11/2023.
//

import Foundation
class URLCreator {
    //MARK: - properties
    private var endPoint = ""
    private let base_url = "https://gateway.marvel.com/"
    
    //MARK: - Methods
    func getMoviesLIst() -> URL{
        endPoint = "v1/public/comics"
        return URL(string: base_url + endPoint)!
    }
    
    func getOneMovie(id:Int) -> URL{
        endPoint = "v1/public/comics/\(id)"
        return URL(string: base_url + endPoint)!
    }
}
