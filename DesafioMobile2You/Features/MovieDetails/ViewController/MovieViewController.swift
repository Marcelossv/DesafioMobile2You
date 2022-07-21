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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
    
    
    
    
}
