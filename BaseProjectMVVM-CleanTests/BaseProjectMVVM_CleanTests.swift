//
//  BaseProjectMVVM_CleanTests.swift
//  BaseProjectMVVM-CleanTests
//
//  Created by Faraz Ahmed_SCT on 22/09/2022.
//

import XCTest

@testable import BaseProjectMVVM_Clean

class HomeViewModelSuccessTest: XCTestCase {
    
    func testUsecase() {
        let expecation = self.expectation(description: "Should not return error")
        let defaultPopularUsecase = DefaultMoviePopularUseCase(homeRepository: HomeRemoteRepository())
        defaultPopularUsecase.fetchPopularMovies { response, _ in
            if response != nil {
                expecation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1)
    }
    
    func testUsecase2() {
        let expecation = self.expectation(description: "Should not return error")
        let defaultPopularUsecase = DefaultMovieSearchUseCase(homeRepository: HomeRemoteRepository())
        defaultPopularUsecase.fetchSearchResult(query: "abc") { response, _ in
            if response != nil {
                expecation.fulfill()
            }
        }
        self.waitForExpectations(timeout: 1)
    }
    
    func testHomeViewModelSuccess() {
        let expecation = self.expectation(description: "Should not return error")

        let vm = HomeDependencyProvider.viewModel
        vm.loadMovieDetail(method: .remote, movieID: "")
        vm.onSuccessMoviesFetch = { response in
            expecation.fulfill()
        }
        self.waitForExpectations(timeout: 1)
    }
    
}

//class HomeViewModelFailureTest: XCTestCase {
//    func testHomeViewModelFailure() {
//        let expecation = self.expectation(description: "Should return error")
//        let vm = DefaultHomeViewModel()
//        vm.loadPopularMovie(method: .remote)
//        vm.onError = { error in
//            expecation.fulfill()
//        }
//        self.waitForExpectations(timeout: 2)
//    }
//}
//
//class MoviesSuccessTest: XCTestCase {
//
//    func testPopularMoviesSuccessUsecase() {
//        let expecation = self.expectation(description: "Should return error")
//        let useCase = DefaultMoviePopularUseCase()
//        useCase.fetchPopularMovies(method: .remote) { response, errorMsg in
//            if response != nil {
//                expecation.fulfill()
//            }
//        }
//        self.waitForExpectations(timeout: 1)
//    }
//
//    func testMovieDetailSuccessUsecase() {
//        let expecation = self.expectation(description: "Should return error")
//        let useCase = DefaultMovieDetailUseCase()
//        useCase.fetchMovieDetail(method: .remote, movieID: "123") { response, errorMsg in
//            if response != nil {
//                expecation.fulfill()
//            }
//        }
//        self.waitForExpectations(timeout: 1)
//    }
//}
//
//class MoviesFailureTest: XCTestCase {
//
//    func testMovieDetailFailureUsecase() {
//        let expecation = self.expectation(description: "Should return error")
//        let useCase = DefaultMovieDetailUseCase()
//        useCase.fetchMovieDetail(method: .remote, movieID: "") { response, errorMsg in
//            if errorMsg != nil {
//                expecation.fulfill()
//            }
//        }
//        self.waitForExpectations(timeout: 2)
//    }
//}
