//
//  MoviePopularUseCase.swift
//  BaseProjectMVVM-Clean
//
//  Created by Faraz Ahmed_SCT on 21/09/2022.
//

import Foundation

protocol MoviePopularUseCase {
    func fetchPopularMovies(completion: @escaping (MovieResponse?, String?) -> ())
}

class DefaultMoviePopularUseCase: MoviePopularUseCase {
    private let homeRepository = HomeRemoteRepository()

    /// To fetch popular movies
    /// - Parameter completion: closure to be executed once the data for popular movies is fetched from server
    func fetchPopularMovies(completion: @escaping (MovieResponse?, String?) -> ()) {
        homeRepository.fetchPopularMovies { response, errorMsg in
            if let errorMsg = errorMsg {
                completion(nil, errorMsg)
                return
            }
            completion(response, nil)
        }
    }
}
