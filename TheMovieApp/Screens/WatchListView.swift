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
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \MovieEntity.id, ascending: true)],
        animation: .default)
    private var moviesEntity: FetchedResults<MovieEntity>
    
    var movies: [Movie] = []
    
    var body: some View {
        NavigationStack {
            
                VStack{
                    List {
                        ForEach(moviesEntity, id: \.id) { movieEntity in
                            NavigationLink {
                                MovieDetailView(movie: Movie(id: movieEntity.id, adult: movieEntity.adult, backdropPath: movieEntity.backdropPath, originalLanguage: movieEntity.originalLanguage, originalTitle: movieEntity.originalTitle, overview: movieEntity.overview, popularity: movieEntity.popularity, posterPath: movieEntity.posterPath, releaseDate: movieEntity.releaseDate, title: movieEntity.title, video: movieEntity.video, voteAverage: movieEntity.voteAverage, voteCount: movieEntity.voteCount))
                            } label: {
                                MovieCardInfoView(movie: Movie(id: movieEntity.id, adult: movieEntity.adult, backdropPath: movieEntity.backdropPath, originalLanguage: movieEntity.originalLanguage, originalTitle: movieEntity.originalTitle, overview: movieEntity.overview, popularity: movieEntity.popularity, posterPath: movieEntity.posterPath, releaseDate: movieEntity.releaseDate, title: movieEntity.title, video: movieEntity.video, voteAverage: movieEntity.voteAverage, voteCount: movieEntity.voteCount))
                            }
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color(red: 36.0/255, green: 42.0/255, blue: 50.0/255))
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(.plain)
                .navigationTitle("Watch List")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .background(Color(red: 36.0/255, green: 42.0/255, blue: 50.0/255))
                
            
        }
        .searchable(text: $seachtext, prompt: "Search for Movies")
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
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { moviesEntity[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

#Preview {
    WatchListView(movies: [Movie(id: 893723, adult: false, backdropPath: "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg", originalLanguage: "en", originalTitle: "PAW Patrol: The Mighty Movie", overview: "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.", popularity: 623.827, posterPath: "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg", releaseDate: Date(), title: "PAW Patrol: The Mighty Movie", video: false, voteAverage: 6.928, voteCount: 125), Movie(id: 893724, adult: false, backdropPath: "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg",  originalLanguage: "en", originalTitle: "PAW Patrol: The Mighty Movie", overview: "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.", popularity: 623.827, posterPath: "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg", releaseDate: Date(), title: "PAW Patrol: The Mighty Movie", video: false, voteAverage: 6.928, voteCount: 125)])
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        .colorScheme(.dark)
}

struct MovieCardInfoView: View {
    
    let movie: Movie
    
    var body: some View {
        HStack {
            PosterImageView(imageUrl: ImageUtil.getImageUrl(path: movie.posterPath))
            VStack(alignment: .leading){
                Text(movie.title)
                    .lineLimit(2)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                Text("\(Image(systemName: "star")) \(movie.voteAverage, specifier: "%.2f")")
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
