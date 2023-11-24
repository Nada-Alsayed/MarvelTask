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
    private let base_url = "http://gateway.marvel.com/"
    
    //MARK: - Methods
    func getMoviesLIst() -> URL{
        endPoint = "v1/public/comics?ts=1&apikey=\(ConstantStrings.API_KEY)&hash=\(ConstantStrings.API_KEY)"
        return URL(string: base_url + endPoint)!
    }
    
    func getOneMovie(id:Int) -> URL{
        endPoint = "v1/public/comics/\(id)?ts=1&apikey=\(ConstantStrings.API_KEY)&hash=\(ConstantStrings.API_KEY)"
        return URL(string: base_url + endPoint)!
    }
}
