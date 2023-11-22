//
//  MovieDetail.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 15/11/23.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    @State private var aboutMenu = true
    @State private var reviewsMenu = false
    @State private var castMenu = false
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, content: {
                
                BackdropImageView(imageUrl: movie.getBackdropPath(), bottomLeadingRadius: 20, bottomTrailingRadius: 20)
                
                VoteAverageView(voteAverage: movie.vote_average)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: -60, trailing: 5))
                    .offset(x: 0, y: -51)
                
                PosterImageTitleView(movie: movie)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 150, alignment: .top)
                .padding(EdgeInsets(top: 0, leading: 30, bottom: -95, trailing: 30))
                .offset(x: 0, y: -95)
                
                
                HStack(alignment: .center){
                    Text("\(Image(systemName: "calendar")) \(dateFormatter.string(from:  movie.release_date))")
                    Text("|")
                    Text("\(Image(systemName: movie.adult ? "figure.child.and.lock.fill" : "figure.child.and.lock.open.fill")) Restriction")
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    .foregroundStyle(Color(red: 146.0/255, green: 146.0/255, blue: 157.0/255))
                VStack {
                    HStack {
                        Button {
                            aboutMenu = true
                            reviewsMenu = false
                            castMenu = false
                        } label: {
                            VStack {
                                Text("About Movie")
                                    .font(.headline)
                                if(aboutMenu){
                                    Rectangle()
                                        .frame(maxHeight: 5)
                                        .foregroundStyle(Color(red: 58.0/255, green: 63.0/255, blue: 71.0/255))
                                } else {
                                    Rectangle()
                                        .frame(maxHeight: 5)
                                        .foregroundStyle(Color(red: 37.0/255, green: 40.0/255, blue: 54.0/255))
                                }
                            }
                        }
                        Spacer()
                        Button {
                            aboutMenu = false
                            reviewsMenu = true
                            castMenu = false
                        } label: {
                            VStack {
                                Text("Reviews")
                                    .font(.headline)
                                if(reviewsMenu){
                                    Rectangle()
                                        .frame(maxHeight: 5)
                                        .foregroundStyle(Color(red: 58.0/255, green: 63.0/255, blue: 71.0/255))
                                } else {
                                    Rectangle()
                                        .frame(maxHeight: 5)
                                        .foregroundStyle(Color(red: 37.0/255, green: 40.0/255, blue: 54.0/255))
                                }
                                
                            }
                        }
                        Spacer()
                        Button {
                            aboutMenu = false
                            reviewsMenu = false
                            castMenu = true
                        } label: {
                            VStack {
                                Text("Cast")
                                    .font(.headline)
                                if(castMenu){
                                    Rectangle()
                                        .frame(maxHeight: 5)
                                        .foregroundStyle(Color(red: 58.0/255, green: 63.0/255, blue: 71.0/255))
                                } else {
                                    Rectangle()
                                        .frame(maxHeight: 5)
                                        .foregroundStyle(Color(red: 37.0/255, green: 40.0/255, blue: 54.0/255))
                                }
                                
                            }
                        }
                    }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    
                    if aboutMenu {
                        Text("\(movie.overview)")
                            .foregroundStyle(.white)
                    } else if reviewsMenu {
                        Text("Building...")
                            .foregroundStyle(.white)
                    } else {
                        Text("\(movie.overview)")
                            .foregroundStyle(.white)
                    }
                    
                    
                }.padding()
            })
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .topLeading)
            .foregroundColor(.white)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button("\(Image(systemName: "bookmark"))"){
                        print("Ok")
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Detail")
        .background(Color(red: 37.0/255, green: 40.0/255, blue: 54.0/255))
    }
}

struct PosterImageTitleView : View {
    
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .bottom) {
            
            PosterImageView(imageUrl: movie.getPosterPath())
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(.orange, lineWidth: 2))
            
            VStack() {
                Text(movie.title)
                    .font(.system(size: 24))
                    .bold()
                    .foregroundStyle(.white)
                    .lineLimit(2)
            }
            .frame(maxWidth: .infinity, maxHeight: 75, alignment: .leading)
            
        }
    }
}

#Preview {
    NavigationStack {
        MovieDetailView(movie: Movie(adult: false, backdrop_path: "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg", id: 893723, original_language: "en", original_title: "PAW Patrol: The Mighty Movie", overview: "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.", popularity: 623.827, poster_path: "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg", release_date: Date(), title: "PAW Patrol: The Mighty Movie", video: false, vote_average: 6.928, vote_count: 125))
    }
}
