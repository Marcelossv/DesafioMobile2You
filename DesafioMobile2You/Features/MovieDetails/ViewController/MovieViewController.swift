//
//  MovieViewController.swift
//  DesafioMobile2You
//
//  Created by Marcelo Silva on 21/07/22.
//

import UIKit

class MovieViewController: UIViewController {
    
    var movieView: MovieView?
    var viewModel: MovieViewModel = MovieViewModel()
    
    
    override func loadView() {
        self.movieView = MovieView()
        self.view = self.movieView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieView?.configTableViewProtocols(delegate: self, datasource: self)
        self.viewModel.delegate(delegate: self)
        self.viewModel.getMovieDetailsRequest()
        self.viewModel.getSimilarMoviesRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
}

//MARK: - UITableView Delegate , UITableView DataSource, UIScrollViewDelagate

extension MovieViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageMovieCell.identifier, for: indexPath) as? ImageMovieCell
            if let movieDetails = self.viewModel.movieDetails{
                cell?.setupCell(movie: movieDetails)
            }
            return cell ?? UITableViewCell()
        
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieNameCell.identifier, for: indexPath) as? MovieNameCell
            if let movieDetails = self.viewModel.movieDetails{
                cell?.setupCell(movie: movieDetails)
            }
            return cell ?? UITableViewCell()
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: SimilarMoviesCell.identifier, for: indexPath) as? SimilarMoviesCell
            if let similarMovies = self.viewModel.similarMovies, let movieDetails = self.viewModel.movieDetails{
                cell?.setupCellSimilarMovies(movie: similarMovies.results[indexPath.row], genre: movieDetails)
            }
            return cell ?? UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return 400
        case 1:
            return 95
        default:
            return 110
        }
    }
    

    
}


//MARK: - MovieViewModelDelegate

extension MovieViewController: MovieViewModelDelegate {
    func success() {
        DispatchQueue.main.async {
            self.movieView?.tableView.reloadData()
        }
    
    }
    
    func error() {
        print(#function)
    }
    
    
}
