//
//  MovieDetailViewViewModel.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 27/11/23.
//

import Foundation
import SwiftUI

@MainActor
class MovieDetailViewViewModel: ObservableObject {
    
    @Published var aboutMenu = true
    @Published var reviewsMenu = false
    @Published var castMenu = false
    @Published var isFavorite = true
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter
    }()
    
    func checkFavorite(movie: Movie, moviesEntity: FetchedResults<MovieEntity>) -> Void {
        for movieResult in moviesEntity {
            if movie.id == movieResult.id {
                self.isFavorite = true
                return
            }
        }
        self.isFavorite = false
    }
}
