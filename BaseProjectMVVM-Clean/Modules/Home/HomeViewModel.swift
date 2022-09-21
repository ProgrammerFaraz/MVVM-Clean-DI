//
//  HomeViewModel.swift
//  BaseProjectMVVM-Clean
//
//  Created by Faraz Ahmed_SCT on 20/09/2022.
//

import Foundation

class HomeViewModel {
    
    private var popularUseCase = DefaultMoviePopularUseCase()
//    private var detailsUseCase = DefaultMovieDetailUseCase()
//    private var searchedUseCase = DefaultMovieSearchUseCase()

    var onSuccessMoviesFetch: ((MovieResponse)->Void)?
    var onError: ((String)->Void)?
    
    func loadPopularMovie() {
        popularUseCase.fetchPopularMovies { [weak self] response, errorMsg in
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
