//
//  WatchListView.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 16/11/23.
//

import Foundation
import SwiftUI

struct WatchListView: View {
    
    @State private var seachtext = ""
    
    var movies: [Movie] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .trailing, spacing: 15) {
                    ForEach(searchMoviesResults, id: \.id) { movie in
                        NavigationLink {
                            MovieDetailView(movie: movie)
                        } label: {
                            MovieCardInfoView(movie: movie)
                        }
                    }
                }.padding()
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .navigationTitle("Watch List")
        }.searchable(text: $seachtext, prompt: "Search for Movies")
    }
    
    var searchMoviesResults: [Movie] {
        if(seachtext.isEmpty){
            return movies
        } else {
            return movies.filter{
                $0.title.contains(seachtext)
            }
        }
    }
}

#Preview {
    WatchListView(movies: [Movie(adult: false, backdrop_path: "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg", id: 893723, original_language: "en", original_title: "PAW Patrol: The Mighty Movie", overview: "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.", popularity: 623.827, poster_path: "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg", release_date: Date(), title: "PAW Patrol: The Mighty Movie", video: false, vote_average: 6.928, vote_count: 125), Movie(adult: false, backdrop_path: "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg", id: 893724, original_language: "en", original_title: "PAW", overview: "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.", popularity: 623.827, poster_path: "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg", release_date: Date(), title: "PAW Patrol: The Mighty Movie", video: false, vote_average: 6.928, vote_count: 125), Movie(adult: false, backdrop_path: "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg", id: 893725, original_language: "en", original_title: "PAW Patrol: The Mighty Movie", overview: "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.", popularity: 623.827, poster_path: "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg", release_date: Date(), title: "PAW Patrol: The Mighty Movie", video: false, vote_average: 6.928, vote_count: 125), Movie(adult: false, backdrop_path: "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg", id: 893726, original_language: "en", original_title: "PAW Patrol: The Mighty Movie", overview: "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.", popularity: 623.827, poster_path: "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg", release_date: Date(), title: "PAW Patrol: The Mighty Movie", video: false, vote_average: 6.928, vote_count: 125), Movie(adult: false, backdrop_path: "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg", id: 893727, original_language: "en", original_title: "PAW Patrol: The Mighty Movie", overview: "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.", popularity: 623.827, poster_path: "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg", release_date: Date(), title: "PAW Patrol: The Mighty Movie", video: false, vote_average: 6.928, vote_count: 125), Movie(adult: false, backdrop_path: "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg", id: 893728, original_language: "en", original_title: "PAW Patrol: The Mighty Movie", overview: "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.", popularity: 623.827, poster_path: "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg", release_date: Date(), title: "PAW Patrol: The Mighty Movie", video: false, vote_average: 6.928, vote_count: 125)])
}

struct MovieCardInfoView: View {
    
    let movie: Movie
    
    var body: some View {
        HStack {
            PosterImageView(imageUrl: movie.getPosterPath())
            VStack(alignment: .leading){
                Text(movie.title)
                    .lineLimit(2)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                Text("\(Image(systemName: "star")) \(movie.vote_average, specifier: "%.2f")")
                    .padding(.top)
                    .foregroundStyle(.orange)
                Spacer()
                Text("\(Image(systemName: "ticket")) Action")
                    .foregroundStyle(.white)
                Spacer()
                Text("\(Image(systemName: "calendar")) 2021")
                    .foregroundStyle(.white)
                Spacer()
                Text("\(Image(systemName: "clock")) 139 minutes")
                    .foregroundStyle(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.frame(maxHeight: 170, alignment: .leading)
    }
}
