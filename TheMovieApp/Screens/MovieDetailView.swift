//
//  MovieDetail.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 15/11/23.
//

import SwiftUI

struct MovieDetailView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var viewModel = MovieDetailViewViewModel()
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \MovieEntity.id, ascending: true)],
        predicate: nil,
        animation: .default)
    var moviesEntity: FetchedResults<MovieEntity>
    
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, content: {
                
                BackdropImageView(imageUrl: ImageUtil.getImageUrl(path: movie.backdropPath, original: true), bottomLeadingRadius: 20, bottomTrailingRadius: 20)
                
                VoteAverageView(voteAverage: movie.voteAverage)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: -60, trailing: 5))
                    .offset(x: 0, y: -51)
                
                PosterImageTitleView(movie: movie)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 150, alignment: .top)
                .padding(EdgeInsets(top: 0, leading: 30, bottom: -95, trailing: 30))
                .offset(x: 0, y: -95)
                
                
                DetailsAboutMovie(movie: movie, viewModel: viewModel)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10))
                        .foregroundStyle(Color(red: 146.0/255, green: 146.0/255, blue: 157.0/255))
                
                VStack {
                    HStack {
                        Button {
                            viewModel.aboutMenu = true
                            viewModel.reviewsMenu = false
                            viewModel.castMenu = false
                        } label: {
                            VStack {
                                Text("About Movie")
                                    .font(.headline)
                                if(viewModel.aboutMenu){
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
                            viewModel.aboutMenu = false
                            viewModel.reviewsMenu = true
                            viewModel.castMenu = false
                        } label: {
                            VStack {
                                Text("Reviews")
                                    .font(.headline)
                                if(viewModel.reviewsMenu){
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
                            viewModel.aboutMenu = false
                            viewModel.reviewsMenu = false
                            viewModel.castMenu = true
                        } label: {
                            VStack {
                                Text("Cast")
                                    .font(.headline)
                                if(viewModel.castMenu){
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
                    
                    if viewModel.aboutMenu {
                        Text("\(movie.overview)")
                            .foregroundStyle(.white)
                    } else if viewModel.reviewsMenu {
                        Text("Building...")
                            .foregroundStyle(.white)
                    } else {
                        Text("Building...")
                            .foregroundStyle(.white)
                    }
                }
                    .padding()
            })
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .topLeading)
            .foregroundColor(.white)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button(viewModel.isFavorite ? "\(Image(systemName: "bookmark.fill"))" : "\(Image(systemName: "bookmark"))"){
                        if viewModel.isFavorite {
                            deleteMovie(movie: movie)
                        } else {
                            addMovie(movie: movie)
                        }
                    }.foregroundColor(.white)
                }
            }
            
        }
        .onAppear(perform: {
            viewModel.checkFavorite(movie: movie, moviesEntity: moviesEntity)
        })
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Detail")
        .background(Color(red: 37.0/255, green: 40.0/255, blue: 54.0/255))
    }
}

extension MovieDetailView {
    private func addMovie(movie: Movie) {
        withAnimation {
            let movieEntity = MovieEntity(context: viewContext)
            movieEntity.id = movie.id
            movieEntity.adult = movie.adult
            movieEntity.backdropPath = movie.backdropPath
            movieEntity.originalLanguage = movie.originalLanguage
            movieEntity.originalTitle = movie.originalTitle
            movieEntity.overview = movie.overview
            movieEntity.popularity = movie.popularity
            movieEntity.posterPath = movie.posterPath
            movieEntity.releaseDate = movie.releaseDate
            movieEntity.title = movie.title
            movieEntity.video = movie.video
            movieEntity.voteAverage = movie.voteAverage
            movieEntity.voteCount = movie.voteCount

            do {
                try viewContext.save()
                viewModel.isFavorite.toggle()
            } catch {
                print(error)
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteMovie(movie: Movie) {
        withAnimation {
            for movieResult in moviesEntity {
                if movie.id == movieResult.id {
                    viewContext.delete(movieResult)
                }
            }
            do {
                try viewContext.save()
                viewModel.isFavorite.toggle()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct DetailsAboutMovie: View {
    
    let movie: Movie
    var viewModel: MovieDetailViewViewModel
    
    var body: some View {
        HStack(alignment: .center){
            Text("\(Image(systemName: "calendar")) \(viewModel.dateFormatter.string(from:  movie.releaseDate)) | \(Image(systemName: "person.2.fill")) \(movie.voteCount) | \(Image(systemName: movie.adult ? "figure.child.and.lock.fill" : "figure.child.and.lock.open.fill")) Age")
        }
    }
}


#Preview {
    NavigationStack {
        MovieDetailView(movie: Movie(id: 1, adult: false, backdropPath: "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg",  originalLanguage: "en", originalTitle: "PAW Patrol: The Mighty Movie", overview: "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.", popularity: 623.827, posterPath: "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg", releaseDate: Date(), title: "PAW Patrol: The Mighty Movie", video: false, voteAverage: 6.928, voteCount: 1025))
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
    .colorScheme(.dark)
}
