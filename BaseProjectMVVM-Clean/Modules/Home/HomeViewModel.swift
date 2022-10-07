//
//  HomeViewModel.swift
//  BaseProjectMVVM-Clean
//
//  Created by Faraz Ahmed_SCT on 20/09/2022.
//

import Foundation

protocol HomeViewModel {
    func loadPopularMovie(method: FetchingType)
    func loadMovieDetail(method: FetchingType, movieID: String)
    func loadMovieBySearch(method: FetchingType, query: String)
}

extension HomeViewModel {
    
}

class DefaultHomeViewModel: HomeViewModel {
    
    private var popularUseCase: MoviePopularUseCase
    private var detailsUseCase: MovieDetailUseCase
    private var searchedUseCase: MovieSearchUseCase

    var onSuccessMoviesFetch: ((MovieResponse)->Void)?
    var onError: ((String)->Void)?
    
    init(popularUseCase: MoviePopularUseCase, detailsUseCase: MovieDetailUseCase, searchedUseCase: MovieSearchUseCase) {
        self.popularUseCase = popularUseCase
        self.detailsUseCase = detailsUseCase
        self.searchedUseCase = searchedUseCase
    }

//    init(popularUseCase: DefaultMoviePopularUseCase) {
//        self.popularUseCase = popularUseCase
//    }
//
//    init(detailsUseCase: DefaultMovieDetailUseCase) {
//        self.popularUseCase = popularUseCase
//    }
//
//    init(searchedUseCase: DefaultMovieSearchUseCase) {
//        self.popularUseCase = popularUseCase
//    }
    
    func loadPopularMovie(method: FetchingType) {
        popularUseCase.fetchPopularMovies(method: method) { [weak self] response, errorMsg in
            guard let self = self else { return }
            if let errorMsg = errorMsg {
                self.onError?(errorMsg)
                return
            }
            guard let response = response else { return }
            self.onSuccessMoviesFetch?(response)
        }
    }
    
    func loadMovieDetail(method: FetchingType, movieID: String) {
        detailsUseCase.fetchMovieDetail(method: method, movieID: movieID) { [weak self] response, errorMsg in
            guard let self = self else { return }
            if let errorMsg = errorMsg {
                self.onError?(errorMsg)
                return
            }
            guard let response = response else { return }
            self.onSuccessMoviesFetch?(response)
        }
    }
    
    func loadMovieBySearch(method: FetchingType, query: String) {
        searchedUseCase.fetchSearchResult(method: method, query: query) { [weak self] response, errorMsg in
            guard let self = self else { return }
            if let errorMsg = errorMsg {
                self.onError?(errorMsg)
                return
            }
            guard let response = response else { return }
            self.onSuccessMoviesFetch?(response)
        }
    }

}
