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
    
    func fetchPopularMovies(from method: FetchingType = .automatic, completion:@escaping (MovieResponse?, String?) -> ()) {
        remoteDataSource.fetchPopularMovies { result in
            switch result {
            case .success(let response):
                completion(response, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func fetchSearchedMovies(query: String, from method: FetchingType = .automatic, completion:@escaping (MovieResponse?, String?) -> ()) {
        remoteDataSource.fetchSearchedMovies(query: query) { result in
            switch result {
            case .success(let response):
                completion(response, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    func fetchMovieDetails(movieID: String, from method: FetchingType = .automatic, completion:@escaping (MovieResponse?, String?) -> ()) {
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


//
//  NetworkManager.swift
//  Generic-Network-Layer
//
//  Created by Shubham on 01/09/21.
//

import Foundation

/// Custom Error enum that we'll use in case
enum NetworkError: Error {
    case noInternet
    case apiFailure
    case invalidResponse
    case decodingError
}

/// An enum for various HTTPMethod. I've implemented GET and POST. I'll update the code and add the rest shortly :D
fileprivate enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

/// to provide data to the API Calls
typealias Parameters = [String : Any]


/// for encoding the Query Parameters in case of a GET call. Queries are passed in the ?q=<>&<> format
fileprivate enum URLEncoding {
    case queryString
    case none
    
    func encode(_ request: inout URLRequest, with parameters: Parameters)  {
        switch self {
        /// In case we need to pass Query Params to GET / Rarely for POST requests too
        case .queryString:
            guard let url = request.url else { return }
            if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
               !parameters.isEmpty {
                
                urlComponents.queryItems = [URLQueryItem]()
                for (k, v) in parameters {
                    let queryItem = URLQueryItem(name: k, value: "\(v)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
                    urlComponents.queryItems?.append(queryItem)
                }
                request.url = urlComponents.url
            }
            
        /// default case f
        case .none:
            break
        }
    }
}
