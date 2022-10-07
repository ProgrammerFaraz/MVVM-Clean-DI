//
//  HomeRemoteRepository.swift
//  BaseProjectMVVM-Clean
//
//  Created by Faraz Ahmed_SCT on 20/09/2022.
//

import Foundation

class HomeRemoteRepository: BaseRepository {
    
    private var remoteDataSource: HomeRemoteDataSource!

    override init() {
        remoteDataSource = HomeRemoteDataSource()
    }
    
    func fetchPopularMovies(from method: FetchingType, completion:@escaping (MovieResponse?, String?) -> ()) {
        switch method {
        case .remote:
            remoteDataSource.fetchPopularMovies { result in
                switch result {
                case .success(let response):
                    completion(response, nil)
                case .failure(let error):
                    completion(nil, error.localizedDescription)
                }
            }
        case .local:
            //Add loading from local DB logic here
            print("Loading from local DB here")
        }
    }
    
    func fetchSearchedMovies(from method: FetchingType, query: String, completion:@escaping (MovieResponse?, String?) -> ()) {
        remoteDataSource.fetchSearchedMovies(query: query) { result in
            switch result {
            case .success(let response):
                completion(response, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func fetchMovieDetails(from method: FetchingType, movieID: String, completion:@escaping (MovieResponse?, String?) -> ()) {
        remoteDataSource.fetchMovieDetails(movieID: movieID) { result in
            switch result {
            case .success(let response):
                completion(response, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
