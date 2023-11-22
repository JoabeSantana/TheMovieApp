//
//  MovieService.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 19/11/23.
//

import Foundation

enum MovieServiceError: Error {
    case invalidURL
    case couldNotReturnMovieList(errorCode: Int)
    case couldNotDecodeObject
    case couldNotGetError
}

protocol MovieServiceProtocol {
    func fetchMovieList(page: Int) async throws -> [Movie]
}

class MovieService: MovieServiceProtocol {
    
    func fetchMovieList(page: Int = 1) async throws -> [Movie] {
        
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NzAwNDkwNmU1OGQwMWMzNTkwMjc5Yjg2MDkxNjc2ZCIsInN1YiI6IjY1NGFkN2ZmZmQ0ZjgwMDExZWQyZTgzMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.w7bnNINfJIabmAm_gRv0VlesdyZYTvWv9Cqbqim8Scc"
        ]
        
        let urlString = "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=\(page)"

        guard let url = URL(string: urlString) else {
            throw MovieServiceError.invalidURL
        }
        
        let request = NSMutableURLRequest(url: url,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        do {
            let (data, _) = try await URLSession.shared.data(for: request as URLRequest)

            //let response = try JSONDecoder().decode(DogResponse.self, from: jsonDogData.data(using: .utf8)!)
            let response = try JSONDecoder().decode(MovieResponse.self, from: data)
            return response.results
        } catch {
            print(error)
            if let urlError = error as? URLError {
                throw MovieServiceError.couldNotReturnMovieList(errorCode: urlError.errorCode)
            } else if let _ = error as? DecodingError {
                throw MovieServiceError.couldNotDecodeObject
            } else {
                throw MovieServiceError.couldNotGetError
            }
        }
    }
}
