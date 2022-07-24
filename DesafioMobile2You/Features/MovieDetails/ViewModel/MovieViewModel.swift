//
//  MovieViewModel.swift
//  DesafioMobile2You
//
//  Created by Marcelo Silva on 21/07/22.
//

import Foundation

protocol MovieViewModelDelegate: AnyObject {
    func success()
    func error()
}

class MovieViewModel{
    
    private let service: MovieService = MovieService()
    private let network: SimilarMoviesService = SimilarMoviesService()
    private weak var delegate: MovieViewModelDelegate?
    var movieDetails: MovieDetails?
    var similarMovies: SimilarMovies?
    
    public var numberOfRows: Int {
        similarMovies?.results.count ?? 0
    }
    
    public func delegate (delegate:MovieViewModelDelegate?){
        self.delegate = delegate
    }
    
    public func getMovieDetailsRequest(){
        self.service.getMovieDetails { success, error in
            if let success = success {
                self.movieDetails = success
                self.delegate?.success()
            } else {
                self.delegate?.error()
            }
        }
    }
    
    public func getSimilarMoviesRequest(){
        self.network.getSimilarMovies { success, error in
            if let success = success {
                self.similarMovies = success
                self.delegate?.success()
            } else {
                self.delegate?.error()
            }
        }
    }
    
}
