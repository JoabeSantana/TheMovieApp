//
//  PosterImageTitleView.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 27/11/23.
//

import SwiftUI

struct PosterImageTitleView : View {
    
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .bottom) {
            NavigationStack {
                NavigationLink {
                    FullImageView(url: ImageUtil.getImageUrl(path: movie.posterPath, original: true))
                        .background(ColorUtil.primaryColor)
                } label: {
                    PosterImageView(imageUrl: ImageUtil.getImageUrl(path: movie.posterPath))
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(.orange, lineWidth: 2))
                }

            }
            
            VStack() {
                Text(movie.title)
                    .font(.system(size: 24))
                    .bold()
                    .foregroundStyle(.white)
                    .lineLimit(2)
            }
            .frame(maxWidth: .infinity, maxHeight: 75, alignment: .leading)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 150, alignment: .top)
        .padding(EdgeInsets(top: 0, leading: 30, bottom: -95, trailing: 30))
        .offset(x: 0, y: -95)
    }
}

#Preview {
    PosterImageTitleView(movie: Movie(id: 1, adult: false, backdropPath: "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg",  originalLanguage: "en", originalTitle: "PAW Patrol: The Mighty Movie", overview: "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.", popularity: 623.827, posterPath: "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg", releaseDate: Date(), title: "PAW Patrol: The Mighty Movie", video: false, voteAverage: 6.928, voteCount: 1025))
}
