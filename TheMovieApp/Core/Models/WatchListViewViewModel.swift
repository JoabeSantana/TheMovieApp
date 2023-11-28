//
//  WatchListViewViewModel.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 27/11/23.
//

import SwiftUI

@MainActor
class WatchListViewViewModel: ObservableObject {
    
    @Published var seachtext = ""
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter
    }()
    
    func getMovieFromEntity(entity: FetchedResults<MovieEntity>.Element) -> Movie {
        Movie(id: entity.id, adult: entity.adult, backdropPath: entity.backdropPath, originalLanguage: entity.originalLanguage, originalTitle: entity.originalTitle, overview: entity.overview, popularity: entity.popularity, posterPath: entity.posterPath, releaseDate: entity.releaseDate, title: entity.title, video: entity.video, voteAverage: entity.voteAverage, voteCount: entity.voteCount)
    }
}
