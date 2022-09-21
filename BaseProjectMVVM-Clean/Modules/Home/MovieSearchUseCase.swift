//
//  MovieSearchUseCase.swift
//  BaseProjectMVVM-Clean
//
//  Created by Faraz Ahmed_SCT on 21/09/2022.
//

import Foundation

protocol MovieSearchUseCase {
    func fetchSearchResult(query: String, completion: @escaping (MovieResponse?, String?) -> ())
}

class DefaultMovieSearchUseCase: MovieSearchUseCase {
    private let homeRepository = HomeRemoteRepository()
    
    /// To fetch search results
    /// - Parameters:
    ///   - query: search query string
    ///   - completion: closure to be executed once the search result is fetched from the server
    func fetchSearchResult(query: String, completion: @escaping (MovieResponse?, String?) -> ()) {
        homeRepository.fetchSearchedMovies(query: query) { response, errorMsg in
            if let errorMsg = errorMsg {
                completion(nil, errorMsg)
                return
            }
            completion(response, nil)
        }
    }
}
