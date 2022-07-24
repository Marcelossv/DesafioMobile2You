//
//  GenreService.swift
//  DesafioMobile2You
//
//  Created by Marcelo Silva on 24/07/22.
//

import Foundation

protocol GenreServiceProtocol: GenericService {
    func getGenres(completion: @escaping completion<Genre?>)
}

class GenreService: GenreServiceProtocol{
    
    static let shared = GenreService()
    var genres = [Genre]()
    
    func getGenres(completion: @escaping completion<Genre?>) {
        let urlString: String = "https://api.themoviedb.org/3/genre/movie/list?api_key=98faade711e40e4e0e8dab3f329fecef&language=en-US"
    
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
            
            guard let response = response as? HTTPURLResponse else {
                return completion(nil, Error.errorDescription(message: "error response"))
            }
            
            if response.statusCode == 200 {
                
                do {
                    let model:Genre = try JSONDecoder().decode(Genre.self, from: data)
//                    self.genres = model
                    completion(model, nil )
                } catch {
                    return completion(nil, Error.errorDescription(message: "error phars", error: error))
                }
            } else {
                return completion(nil, Error.errorDescription(message: "error", error: error))
            }
        }
        task.resume()
    }
    
}

