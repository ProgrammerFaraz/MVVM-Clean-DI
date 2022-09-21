//
//  API.swift
//  BaseProjectMVVM-Clean
//
//  Created by Faraz Ahmed_SCT on 20/09/2022.
//

import Moya

enum API {
    case popular
    case movie(movieId: String)
    case search(query: String)
}

extension API: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Constants.baseUrl) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .popular:
            return "movie/popular"
        case .movie(let movieId):
            return "movie/\(movieId)"
        case .search:
            return "search/movie"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .popular, .movie:
            return .requestParameters(parameters: ["api_key": Constants.apiKey], encoding: URLEncoding.queryString)
        case .search(let query):
            return .requestParameters(parameters: ["query" : query, "api_key": Constants.apiKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
