//
//  HomeViewModel.swift
//  Marvel
//
//  Created by MAC on 24/11/2023.
//

import Foundation

class HomeViewModel{
    
    private let movieUseCase: GetMoviesUseCase
    private let coredateUseCase: CoreDataUseCase
    private var movies: [Result] = []
    private var movieAPI = Result()
    
    private var filteredMovies: [Result] = []


    var numberOfMovies: Int {
        return movies.count
    }

    init(movieUseCase: GetMoviesUseCase = GetMoviesUseCase(), coredateUseCase : CoreDataUseCase = CoreDataUseCase()) {
        self.movieUseCase = movieUseCase
        self.coredateUseCase = coredateUseCase
    }
    
    //MARK: - Network Functions

    func fetchMovies(url: URL,completion: @escaping () -> Void) {
        movieUseCase.fetchMovies (url: url) { [weak self] response, err in
            guard let response = response else{return}
            self?.movies = response.data?.results ?? []
            completion()
        }
        
    }
    
    func fetchOneMovie(url: URL,completion: @escaping () -> Void) {
        movieUseCase.fetchMovies (url: url) { [weak self] response, err in
            guard let response = response else{return}
            self?.movieAPI = response.data?.results?[0] ?? Result()
            completion()
        }
    }

    func movie(at index: Int) -> Result {
        return movies[index]
    }
    func replaceMovie(at index: Int,movie: Result) {
         movies[index] = movie
    }
    func movie() -> Result {
        return movieAPI
    }
    
    //MARK: - Search Handling Functions

       func filterMovies(by searchText: String) -> Void{
           if searchText.isEmpty {
               filteredMovies = movies
           } else {
               filteredMovies = movies.filter { movie in
               return (movie.title?.lowercased().contains(searchText.lowercased()) ?? false)
               }
           }
       }

       var numberOfFilteredMovies: Int {
           return filteredMovies.count
       }

       func filteredMovie(at index: Int) -> Result {
           return filteredMovies[index]
       }
    
    //MARK: - CoreData Functions
    
    func getSoredMovies() -> [LocalMovie]{
        return coredateUseCase.getSoredMovies()
    }
    
    func insertMovie(movie:LocalMovie){
        coredateUseCase.insertMovie(movie: movie)
    }
    
    func isMovieExist(movieID:Int)->Bool{
        return coredateUseCase.isMovieExist(movieID: movieID)
    }
    
    func getOneMovie(movieID:Int)->LocalMovie{
        return coredateUseCase.getMovie(movieID: movieID)
    }
}
