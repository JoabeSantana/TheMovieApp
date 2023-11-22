//
//  MovieCard.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 21/11/23.
//

import SwiftUI

struct MovieCard: View {
    
    let movie: Movie
    
    var body: some View {
        PosterImageView(imageUrl: movie.getPosterPath())
    }
}
