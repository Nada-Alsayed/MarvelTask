//
//  GetMovies.swift
//  Marvel
//
//  Created by MAC on 24/11/2023.
//

import Foundation
class GetMoviesUseCase {
    private let movieService: NetworkManagerProtocol

    init(movieService: NetworkManagerProtocol = NetworkManager()) {
        self.movieService = movieService
    }

    func fetchMovies(url: URL,completion: @escaping (Response?, Error?) -> Void) {
        movieService.fetchData(url: url, complition: {(root: Response?, err) in
            guard let root = root else { return completion(nil,err)}
            completion(root,nil)
        })
    }
}
