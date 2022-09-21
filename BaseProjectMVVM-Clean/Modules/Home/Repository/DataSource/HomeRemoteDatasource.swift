//
//  HomeRemoteDatasource.swift
//  BaseProjectMVVM-Clean
//
//  Created by Faraz Ahmed_SCT on 20/09/2022.
//

import Foundation

struct HomeRemoteDataSource {

    func fetchPopularMovies(completion: @escaping (Result<MovieResponse, Error>) -> ()) {
        NetworkManager.request(target: .popular, completion: completion)
    }
    
    func fetchMovieDetails(movieID: String, completion: @escaping (Result<MovieResponse, Error>) -> ()) {
        NetworkManager.request(target: .movie(movieId: movieID), completion: completion)
    }
    
    func fetchSearchedMovies(query: String, completion: @escaping (Result<MovieResponse, Error>) -> ()) {
        NetworkManager.request(target: .search(query: query), completion: completion)
    }
}
