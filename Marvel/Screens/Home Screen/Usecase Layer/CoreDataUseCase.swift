//
//  CoreDataUseCase.swift
//  Marvel
//
//  Created by MAC on 25/11/2023.
//

import Foundation

class CoreDataUseCase{
    private let coreData: CoredataManagerProtocol
    
    init(coreData: CoredataManagerProtocol = CoredataManager.sharedInstance) {
        self.coreData = coreData
    }
    
    func getSoredMovies() -> [LocalMovie]{
        return coreData.getStoredMovies()
    }
    
    func insertMovie(movie:LocalMovie){
        coreData.insertMovie(movieToInsert: movie)
    }
    
    func isMovieExist(movieID:Int)->Bool{
        return coreData.isMovieExist(movieID: movieID)
    }
    
    func getMovie(movieID:Int)->LocalMovie{
        return coreData.getOneMovie(movieID: movieID)
    }
}
