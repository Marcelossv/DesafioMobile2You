//
//  MovieViewController.swift
//  DesafioMobile2You
//
//  Created by Marcelo Silva on 21/07/22.
//

import UIKit

class MovieViewController: UIViewController {

    var movieView: MovieView?
    
    override func loadView() {
        self.movieView = MovieView()
        self.view = self.movieView
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieView?.configTableViewProtocols(delegate: self, datasource: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
  
}

//MARK: - UITableView Delegate , UITableView DataSource

extension MovieViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
            return 90
        case 1:
            return 110
        default:
            return 0
        }
    }
    
    
    
    
    
    
}
