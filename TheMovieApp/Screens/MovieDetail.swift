//
//  MovieDetail.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 15/11/23.
//

import SwiftUI

struct MovieDetail: View {
    
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, content: {
            ZStack {
                AsyncImage(url: URL(string: movie.backdrop_path)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(.rect(bottomLeadingRadius: 20, bottomTrailingRadius: 20))
                } placeholder: {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: 220)
                }
                HStack(alignment: .center) {
                    
                    Image(systemName: "star")
                        .foregroundColor(.orange)
                        .bold()
                    Text("\(movie.vote_average, specifier: "%.2f")")
                        .foregroundStyle(.orange)
                        .bold()
                }
                .frame(width: 90, height: 40)
                .background(Color(red: 36.0/255, green: 42.0/255, blue: 50.0/255))
                .clipShape(.capsule)
                .offset(x: 130, y: 70)
                
                HStack() {
                    
                    AsyncImage(url: URL(string: movie.poster_path)) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                            .frame(width: 100, height: 200)
                    } placeholder: {
                        ProgressView()
                    }
                    Text(movie.title)
                }
            }
        })
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(red: 37.0/255, green: 40.0/255, blue: 54.0/255))
        
    }
}

#Preview {
    MovieDetail(movie: Movie(adult: false, backdrop_path: "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg", id: 893723, original_language: "en", original_title: "PAW Patrol: The Mighty Movie", overview: "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.", popularity: 623.827, poster_path: "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg", release_date: Date(), title: "PAW Patrol: The Mighty Movie", video: false, vote_average: 6.928, vote_count: 125) )
}
