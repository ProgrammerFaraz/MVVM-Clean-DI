//
//  MoviePopularUseCase.swift
//  BaseProjectMVVM-Clean
//
//  Created by Faraz Ahmed_SCT on 21/09/2022.
//

import Foundation

protocol MoviePopularUseCase {
    func fetchPopularMovies(method: FetchingType, completion: @escaping (MovieResponse?, String?) -> ())
}

class DefaultMoviePopularUseCase: MoviePopularUseCase {
    private var homeRepository: HomeRemoteRepository

    init(homeRepository: HomeRemoteRepository) {
        self.homeRepository = homeRepository
    }

    /// To fetch popular movies
    /// - Parameter completion: closure to be executed once the data for popular movies is fetched from server
    func fetchPopularMovies(method: FetchingType = .remote, completion: @escaping (MovieResponse?, String?) -> ()) {
        homeRepository.fetchPopularMovies(from: method) { response, errorMsg in
            if let errorMsg = errorMsg {
                completion(nil, errorMsg)
                return
            }
            completion(response, nil)
        }
    }
}
