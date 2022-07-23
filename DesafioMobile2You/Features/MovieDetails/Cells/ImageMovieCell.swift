//
//  ImageMovieCell.swift
//  DesafioMobile2You
//
//  Created by Marcelo Silva on 23/07/22.
//

import UIKit
import AlamofireImage

class ImageMovieCell: UITableViewCell {

    static let identifier: String = "ImageMovieCell"
    
    public let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Image")
        return imageView
    }()

    //MARK: - Initializers
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addElements()
        self.setupConstraints()
        self.initialConfig()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public Functions
    
    public func setupCell(movie:MovieDetails){
        let url = URL(string: movie.posterPath ?? "") ?? URL(fileURLWithPath: "")
        movieImageView.af.setImage(withURL: url)
    
}

    //MARK: - Private Functions
    
    private func initialConfig(){
        self.selectionStyle = .none
    }
    
    private func addElements(){
        self.contentView.addSubview(self.movieImageView)
    }

    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            
            self.movieImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.movieImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.movieImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.movieImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
