//
//  HomeViewController.swift
//  BaseProjectMVVM-Clean
//
//  Created by Faraz Ahmed_SCT on 20/09/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: DefaultHomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindHomeViewModel()
        viewModel?.loadPopularMovie(method: .remote)
    }
    
    private func bindHomeViewModel() {
        viewModel?.onSuccessMoviesFetch = { [weak self] movies in
            guard let self = self else { return }
            self.titleLabel.text = movies.results?.first?.title ?? ""
        }
        viewModel?.onError = { [weak self] error in
            guard let self = self else { return }
            self.titleLabel.text = error
        }
    }
}
