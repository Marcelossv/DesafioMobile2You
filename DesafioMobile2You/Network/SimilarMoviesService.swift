//
//  SimilarMovies.swift
//  DesafioMobile2You
//
//  Created by Marcelo Silva on 23/07/22.
//

import Foundation

protocol SimilarMoviesServiceProtocol: GenericService {
    func getSimilarMovies(completion: @escaping completion<SimilarMovies?>)
}

class SimilarMoviesService: SimilarMoviesServiceProtocol{
    func getSimilarMovies(completion: @escaping completion<SimilarMovies?>) {
        let urlString: String = "https://api.themoviedb.org/3/movie/550/similar?api_key=98faade711e40e4e0e8dab3f329fecef&language=en-US"
    
        guard let url:URL = URL(string: urlString) else{
            return completion(nil, Error.errorDescription(message: "error Url"))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            
            guard let data = data else {
                return completion(nil, Error.errorDescription(message: "error data"))
            }
            
            let json = try? JSONSerialization.jsonObject(with: data)
//            print(json as Any)
            
            guard let response = response as? HTTPURLResponse else {
                return completion(nil, Error.errorDescription(message: "error response"))
            }
            
            if response.statusCode == 200 {
                
                do {
                    let model:SimilarMovies = try JSONDecoder().decode(SimilarMovies.self, from: data)
                    completion(model, nil )
                } catch {
                    print(error)
                    return completion(nil, Error.errorDescription(message: "error phars", error: error))
                    
                }
            } else {
                return completion(nil, Error.errorDescription(message: "error", error: error))
            }
        }
        task.resume()
    }
    
}
