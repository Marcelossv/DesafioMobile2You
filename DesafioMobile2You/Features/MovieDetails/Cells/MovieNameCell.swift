//
//  MovieNameCell.swift
//  DesafioMobile2You
//
//  Created by Marcelo Silva on 21/07/22.
//

import UIKit
import AlamofireImage


class MovieNameCell: UITableViewCell {

    static let identifier: String = "MovieNameCell"
    
    lazy var nameMovieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setupFont(name: FontName.openSansBold, size: 40, color: .white)
        label.text = "Spider - Man"
        return label
    }()
    
    lazy var heartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
        button.contentMode = .scaleToFill
        return button
    }()
    
    lazy var heartImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "heart.fill")
        image.tintColor = .white
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var numberLikesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setupFont(name: FontName.openSansBold, size: 22, color: .white)
        label.text = "1.2m likes"
        return label
    }()
    
    lazy var popularityImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.fill")
        image.tintColor = .white
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var popularityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setupFont(name: FontName.openSansBold, size: 22, color: .white)
        label.text = "Populary"
        return label
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
        self.nameMovieLabel.text = movie.originalTitle
        self.numberLikesLabel.text = "\( movie.voteCount ?? 0) Likes "
        self.popularityLabel.text = "\( movie.popularity ?? 0.0) Views"
    }
    
    //MARK: - Private Functions
    
    private func initialConfig(){
        self.selectionStyle = .none
        self.backgroundColor = .black
    }
    
    private func addElements(){
        self.contentView.addSubview(self.nameMovieLabel)
        self.contentView.addSubview(self.heartButton)
        self.contentView.addSubview(self.heartImageView)
        self.contentView.addSubview(self.numberLikesLabel)
        self.contentView.addSubview(self.popularityImageView)
        self.contentView.addSubview(self.popularityLabel)
    }

    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            
            self.nameMovieLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.nameMovieLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            
            self.heartButton.topAnchor.constraint(equalTo: self.nameMovieLabel.topAnchor),
            self.heartButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            self.heartButton.heightAnchor.constraint(equalToConstant: 30),
            
            
            self.heartImageView.topAnchor.constraint(equalTo: self.nameMovieLabel.bottomAnchor, constant: 15),
            self.heartImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            
            self.numberLikesLabel.centerYAnchor.constraint(equalTo: self.heartImageView.centerYAnchor),
            self.numberLikesLabel.leadingAnchor.constraint(equalTo: self.heartImageView.trailingAnchor, constant: 5),
            
            self.popularityImageView.topAnchor.constraint(equalTo: self.heartImageView.topAnchor),
            self.popularityImageView.trailingAnchor.constraint(equalTo: self.numberLikesLabel.trailingAnchor, constant: 50),
            
            self.popularityLabel.centerYAnchor.constraint(equalTo: self.popularityImageView.centerYAnchor),
            self.popularityLabel.leadingAnchor.constraint(equalTo: self.popularityImageView.trailingAnchor, constant: 5)
            
        
        ])
        
    }
            
    
    
}
