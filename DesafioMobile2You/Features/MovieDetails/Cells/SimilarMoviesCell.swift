//
//  SimilarMoviesCell.swift
//  DesafioMobile2You
//
//  Created by Marcelo Silva on 21/07/22.
//

import UIKit

class SimilarMoviesCell: UITableViewCell {
    
    static let identifier: String = "SimilarMoviesCell"
    
    lazy var movieImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Image")
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var nameMovieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setupFont(name: FontName.openSansBold, size: 22, color: .black)
        label.text = "Spider - Man"
        return label
    }()
    
    lazy var genresMovieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setupFont(name: FontName.openSansRegular, size: 18, color: .black)
        label.text = "1989 Aventura, Drama"
        return label
    }()

    
    //MARK: - Initializers
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addElements()
        self.setupConstraints()
        self.selectionStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Functions
    
    private func addElements(){
        self.contentView.addSubview(self.movieImageView)
        self.contentView.addSubview(self.nameMovieLabel)
        self.contentView.addSubview(self.genresMovieLabel)
    }

    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            
            self.movieImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 5),
            self.movieImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.movieImageView.heightAnchor.constraint(equalToConstant: 100),
            self.movieImageView.widthAnchor.constraint(equalToConstant: 70),
            
            self.nameMovieLabel.bottomAnchor.constraint(equalTo: self.movieImageView.centerYAnchor, constant: 5),
            self.nameMovieLabel.leadingAnchor.constraint(equalTo: self.movieImageView.trailingAnchor, constant: 10),
            
            self.genresMovieLabel.topAnchor.constraint(equalTo: self.movieImageView.centerYAnchor, constant: 5),
            self.genresMovieLabel.leadingAnchor.constraint(equalTo: self.movieImageView.trailingAnchor, constant: 10),
          
          
        ])
        
    }
}
