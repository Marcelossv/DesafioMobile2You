//
//  SimilarMoviesCell.swift
//  DesafioMobile2You
//
//  Created by Marcelo Silva on 21/07/22.
//

import UIKit
import AlamofireImage

class SimilarMoviesCell: UITableViewCell {
    
    static let identifier: String = "SimilarMoviesCell"
    var formatterDate:[Character] = []
    
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
        label.setupFont(name: FontName.openSansBold, size: 22, color: .white)
        label.text = "Spider - Man"
        return label
    }()
    
    lazy var genresMovieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setupFont(name: FontName.openSansRegular, size: 18, color: .white)
        label.text = "1989 Aventura, Drama"
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
    
    public func setupCellSimilarMovies(movie:Result, genre: Genre){
        let url = URL(string: "https://image.tmdb.org/t/p/original\(movie.poster_path)") ?? URL(fileURLWithPath: "")
        movieImageView.af.setImage(withURL: url)
        self.nameMovieLabel.text = movie.title
        self.genresMovieLabel.text = "\(getDate(date: movie.release_date)) \(genre.name ?? "")"
    }
    
    //MARK: - Private Functions
    
//    private func getGenres(movie:Result, genre: MovieDetails) -> String{
//        var genresID = [Int]()
//        for i in 0..<min(movie.genre_ids.count-1, 3) {
//            genresID.append(movie.genre_ids[i])
//        }
//        print(genresID)
//
//        var genres = [Genre]()
//
//        for _ in 0..<genresID.count - 1 {
//            let validGenre = MovieService.shared.genres.first
//            if let id = validGenre {
//                genres.append(id)
//            }
//
//        }
        
        
//        genresID.forEach { id in
//            let validGenre = MovieService.shared.genres.first { genre in                genre.id = id
//            }
//            if let validGenre = validGenre {
//                genres.append(validGenre)
//            }
//        }
        
//        var element = 0
//        var genresDescription = ""
//        genres.forEach { genre in
//            if element > 0 {
//                genresDescription += ", "
//            }
//            genresDescription += genre.name ?? ""
//            element += 1
//        }
//        return genresDescription
//    }
    
    private func getDate(date: String) -> String{
        let stringDate = date.prefix(4)
        return String(stringDate)
    }
    
    private func initialConfig(){
        self.selectionStyle = .none
        self.backgroundColor = .black
    }
    
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
            
            self.nameMovieLabel.bottomAnchor.constraint(equalTo: self.movieImageView.centerYAnchor),
            self.nameMovieLabel.leadingAnchor.constraint(equalTo: self.movieImageView.trailingAnchor, constant: 10),
            
            self.genresMovieLabel.topAnchor.constraint(equalTo: self.nameMovieLabel.bottomAnchor, constant: 5),
            self.genresMovieLabel.leadingAnchor.constraint(equalTo: self.movieImageView.trailingAnchor, constant: 10),
          
          
        ])
        
    }
}
