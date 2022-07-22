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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
// MARK: - Private Functions
    
    private func configHeaderView() -> UIView{
        self.movieView?.tableView.frame = self.view.bounds
        let header = HideTableViewHeader(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        header.imageView.image = UIImage(named: "Image")
        return header
    }
    
}

//MARK: - UITableView Delegate , UITableView DataSource, UIScrollViewDelagate

extension MovieViewController : UITableViewDelegate , UITableViewDataSource, UIScrollViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieNameCell.identifier, for: indexPath) as? MovieNameCell
            return cell ?? UITableViewCell()
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: SimilarMoviesCell.identifier, for: indexPath) as? SimilarMoviesCell
            return cell ?? UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return 95
        case 1:
            return 110
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 500
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return configHeaderView()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = self.movieView?.tableView.tableHeaderView as? HideTableViewHeader else {return}
        header.scrollViewDidScroll(scrollView: scrollView)
    }
}

//MARK: - MovieViewModelDelegate

extension MovieViewController: MovieViewModelDelegate {
    func success() {
        print(#function)
    }
    
    func error() {
        print(#function)
    }
    

}
