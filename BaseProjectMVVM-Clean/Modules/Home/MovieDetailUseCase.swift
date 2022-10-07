//
//  MovieDetailUseCase.swift
//  BaseProjectMVVM-Clean
//
//  Created by Faraz Ahmed_SCT on 21/09/2022.
//

import Foundation

protocol MovieDetailUseCase {
    func fetchMovieDetail(method: FetchingType, movieID: String, completion: @escaping (MovieResponse?, String?) -> ())
}

class DefaultMovieDetailUseCase: MovieDetailUseCase {
    private var homeRepository: HomeRemoteRepository
    
    
    init(homeRepository: HomeRemoteRepository) {
        self.homeRepository = homeRepository
    }
    /// To fetch single movie details
    /// - Parameters:
    ///   - movieId: ID of particular movie for which the data is to be fetched
    ///   - completion: closure to be executed once the movie details is fetched from server
    func fetchMovieDetail(method: FetchingType = .remote, movieID: String, completion: @escaping (MovieResponse?, String?) -> ()) {
        homeRepository.fetchMovieDetails(from: .remote, movieID: movieID) { response, errorMsg in
            if let errorMsg = errorMsg {
                completion(nil, errorMsg)
                return
            }
            completion(response, nil)
        }
    }
}
