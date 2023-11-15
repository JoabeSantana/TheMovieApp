//
//  MovieResponse.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 13/11/23.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [Movie]
    
    enum CodingKeys: CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([Movie].self, forKey: .results)
    }
}
