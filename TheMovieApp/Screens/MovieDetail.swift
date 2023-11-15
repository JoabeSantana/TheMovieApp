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
            
            ZStack() {
                ImageView(imageUrl: movie.backdrop_path, topLeadingRadius: 0, bottomLeadingRadius: 20, bottomTrailingRadius: 20, topTrailingRadius: 0, progressViewMaxWidth: .infinity, progressViewMaxHeight: 220)
                
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
                
                HStack(alignment: .bottom) {
                    
                    ImageView(imageUrl: movie.poster_path, topLeadingRadius: 15, bottomLeadingRadius: 15, bottomTrailingRadius: 15, topTrailingRadius: 15, progressViewMaxWidth: 100, progressViewMaxHeight: 150)
                    VStack() {
                        Text(movie.title)
                            .font(.system(size: 24))
                            .bold()
                            .foregroundStyle(.white)
                        .lineLimit(2)
                    }
                    .frame(maxWidth: 500, maxHeight: 75, alignment: .leading)
                        
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 150, alignment: .bottomLeading)
                    .offset(y: 120)
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
            }.frame(height: 340,alignment: .top)
            
            HStack(alignment: .center){
                Text("\(Image(systemName: "calendar")) 2021")
                Text("|")
                Text("\(Image(systemName: "clock")) 148 Minutes")
                Text("|")
                Text("\(Image(systemName: "ticket")) Action")
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color(red: 146.0/255, green: 146.0/255, blue: 157.0/255))
            VStack(alignment: .leading, spacing: 10){
                Text("About Movie")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
                Text("\(movie.overview)")
                    .foregroundStyle(.white)
            }.padding()
        })
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle("Detail")
        .foregroundColor(.white)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(red: 37.0/255, green: 40.0/255, blue: 54.0/255))
        
    }
}

#Preview {
    MovieDetail(movie: Movie(adult: false, backdrop_path: "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg", id: 893723, original_language: "en", original_title: "PAW Patrol: The Mighty Movie", overview: "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.", popularity: 623.827, poster_path: "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg", release_date: Date(), title: "PAW Patrol: The Mighty Movie", video: false, vote_average: 6.928, vote_count: 125))
    //PAW Patrol: The Mighty Movie
    //Aux()
}


struct Aux: View {
    var body: some View {
        HStack(alignment: .bottom){
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.rect(topLeadingRadius: 20, bottomLeadingRadius: 20, bottomTrailingRadius: 20, topTrailingRadius: 20))
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: 220)
            }
            Text("PAW Patrol: The Mighty Movie")
        }.frame(width: .infinity, height: 150)
    }
}

struct ImageView: View {
    
    let imageUrl: String
    let topLeadingRadius: CGFloat
    let bottomLeadingRadius: CGFloat
    let bottomTrailingRadius: CGFloat
    let topTrailingRadius: CGFloat
    let progressViewMaxWidth: CGFloat
    let progressViewMaxHeight: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.rect(topLeadingRadius: topLeadingRadius, bottomLeadingRadius: bottomLeadingRadius, bottomTrailingRadius: bottomTrailingRadius, topTrailingRadius: topTrailingRadius))
        } placeholder: {
            ProgressView()
                .frame(maxWidth: progressViewMaxWidth, maxHeight: progressViewMaxHeight)
        }
    }
}
