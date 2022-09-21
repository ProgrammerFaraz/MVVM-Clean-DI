//
//  HomeViewController.swift
//  BaseProjectMVVM-Clean
//
//  Created by Faraz Ahmed_SCT on 20/09/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindHomeViewModel()
        viewModel.loadPopularMovie()
    }
    
    private func bindHomeViewModel() {
        viewModel.onSuccessMoviesFetch = { [weak self] movies in
            guard let self = self else { return }
            self.titleLabel.text = movies.results?.first?.title ?? ""
        }
        viewModel.onError = { [weak self] error in
            guard let self = self else { return }
            self.titleLabel.text = error
        }
    }
}
