//
//  HomeDependencyProvider.swift
//  BaseProjectMVVM-Clean
//
//  Created by Faraz Ahmed_SCT on 23/09/2022.
//

import Foundation
import UIKit

struct HomeDependencyProvider {
    
    static var homeRepository: HomeRemoteRepository {
        return HomeRemoteRepository()
    }
    
    static var searchUsecase: MovieSearchUseCase {
        return DefaultMovieSearchUseCase(homeRepository: homeRepository)
    }
    
    static var popularUsecase: MoviePopularUseCase {
        return DefaultMoviePopularUseCase(homeRepository: homeRepository)
    }
    
    static var detailUsecase: MovieDetailUseCase {
        return DefaultMovieDetailUseCase(homeRepository: homeRepository)
    }

    static var viewModel: DefaultHomeViewModel {
        return DefaultHomeViewModel(popularUseCase: popularUsecase, detailsUseCase: detailUsecase, searchedUseCase: searchUsecase)
    }

    static var viewController: HomeViewController {
        let vc = UIStoryboard(name: "Main",
                              bundle: nil).instantiateInitialViewController() as! HomeViewController
        vc.viewModel = viewModel
        return vc
    }
}
