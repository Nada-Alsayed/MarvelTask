//
//  CoredataManagerProtocol.swift
//  Marvel
//
//  Created by MAC on 25/11/2023.
//

import Foundation

protocol CoredataManagerProtocol {
    func insertMovie(movieToInsert: LocalMovie)
    func getStoredMovies() -> [LocalMovie]
    func isMovieExist(movieID:Int) -> Bool
    func getOneMovie(movieID: Int) -> LocalMovie 
}
