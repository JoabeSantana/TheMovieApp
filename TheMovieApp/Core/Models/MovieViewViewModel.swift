//
//  MovieViewViewModel.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 23/11/23.
//

import Foundation
import SwiftUI

@MainActor
class MovieViewViewModel: ObservableObject {
    
    private let service: MovieServiceable
    
    var lastMovieId: Int = 0
    var pageService: Int = 1
    let maxPagesService: Int = 10
    
    @Published var listMoviesModel: [Movie] = []
    
    init(service: MovieServiceable) {
        self.service = service
    }
    
    func fetchMovies(page: Int){
        Task {
            do {
                let moviesList = try await service.fetchMovieList(page: page)
                for movie in moviesList {
                    if (!self.listMoviesModel.contains { itemMovie in itemMovie.id == movie.id }) {
                        self.listMoviesModel.append(movie)
                    }
                }
                self.lastMovieId = self.listMoviesModel.last!.id
                pageService += 1
            } catch {
                print(error)
            }
        }
    }
    
}
