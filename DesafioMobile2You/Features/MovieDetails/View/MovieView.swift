//
//  MovieView.swift
//  DesafioMobile2You
//
//  Created by Marcelo Silva on 21/07/22.
//

import UIKit

class MovieView: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        tableView.register(SimilarMoviesCell.self, forCellReuseIdentifier: SimilarMoviesCell.identifier)
        tableView.register(MovieNameCell.self, forCellReuseIdentifier: MovieNameCell.identifier)
        tableView.register(ImageMovieCell.self, forCellReuseIdentifier: ImageMovieCell.identifier)
        return tableView
    }()
    
    //MARK: - Initializers
    
    override init( frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.setupConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public Funtions
    
    public func configTableViewProtocols(delegate:UITableViewDelegate, datasource:UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = datasource
        
        
    }
    
    //MARK: - Private Functions
    
    private func addElements(){
        self.addSubview(self.tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}
