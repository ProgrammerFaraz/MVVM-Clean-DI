//
//  MovieDetailUseCase.swift
//  BaseProjectMVVM-Clean
//
//  Created by Faraz Ahmed_SCT on 21/09/2022.
//

import Foundation

protocol MovieDetailUseCase {
    func fetchMovieDetail(movieID: String, completion: @escaping (MovieResponse?, String?) -> ())
}

class DefaultMovieDetailUseCase: MovieDetailUseCase {
    private var homeRepository = HomeRemoteRepository()
    
    /// To fetch single movie details
    /// - Parameters:
    ///   - movieId: ID of particular movie for which the data is to be fetched
    ///   - completion: closure to be executed once the movie details is fetched from server
    func fetchMovieDetail(movieID: String, completion: @escaping (MovieResponse?, String?) -> ()) {
        homeRepository.fetchMovieDetails(movieID: movieID) { response, errorMsg in
            if let errorMsg = errorMsg {
                completion(nil, errorMsg)
                return
            }
            completion(response, nil)
        }
    }
}
