//
//  MovieServiceProtocol.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 23/11/23.
//

import Foundation

protocol MovieServiceable {
    func fetchMovieList(page: Int) async throws -> [Movie]
}
