//
//  WatchListView.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 16/11/23.
//

import Foundation
import SwiftUI

struct WatchListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var viewModel = WatchListViewViewModel()
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \MovieEntity.title, ascending: true)],
        animation: .default)
    private var moviesEntity: FetchedResults<MovieEntity>
    
    var movies: [Movie] = []
    
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    ForEach(listMovies(), id: \.id) { movieEntity in
                        NavigationLink {
                            MovieDetailView(movie: viewModel.getMovieFromEntity(entity: movieEntity))
                        } label: {
                            MovieCardInfoView(movie: viewModel.getMovieFromEntity(entity: movieEntity), viewModel: viewModel)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(ColorUtil.primaryColor)
                    }
                    .onDelete(perform: deleteMovies)
                }
                .listStyle(.plain)
                .navigationTitle("watchlist-title")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .background(ColorUtil.primaryColor)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .searchable(text: $viewModel.seachtext, prompt: "search-label")
    }
    
    private func deleteMovies(offsets: IndexSet) {
        withAnimation {
            
            offsets.map { moviesEntity[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func listMovies() -> FetchedResults<MovieEntity> {
        if !viewModel.seachtext.isEmpty {
            moviesEntity.nsPredicate = NSPredicate(format: "title CONTAINS[c] %@", viewModel.seachtext)
        } else {
            moviesEntity.nsPredicate = nil
        }
        return moviesEntity
    }
}

struct MovieCardInfoView: View {
    
    let movie: Movie
    var viewModel: WatchListViewViewModel
    
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
                Text("\(Image(systemName: "calendar")) \(viewModel.dateFormatter.string(from:  movie.releaseDate))")
                    .foregroundStyle(.white)
                Spacer()
                Text("\(Image(systemName: "person.2.fill")) \(movie.voteCount)")
                    .foregroundStyle(.white)
                Spacer()
                HStack{
                    Text("\(Image(systemName: movie.adult ? "figure.child.and.lock.fill" : "figure.child.and.lock.open.fill"))")
                    Text("age-label")
                }
                    .foregroundStyle(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }.frame(maxHeight: 170, alignment: .leading)
    }
}

#Preview {
    WatchListView(movies: [Movie(id: 893723, adult: false, backdropPath: "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg", originalLanguage: "en", originalTitle: "PAW Patrol: The Mighty Movie", overview: "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.", popularity: 623.827, posterPath: "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg", releaseDate: Date(), title: "PAW Patrol: The Mighty Movie", video: false, voteAverage: 6.928, voteCount: 125), Movie(id: 893724, adult: false, backdropPath: "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg",  originalLanguage: "en", originalTitle: "PAW Patrol: The Mighty Movie", overview: "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.", popularity: 623.827, posterPath: "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg", releaseDate: Date(), title: "PAW Patrol: The Mighty Movie", video: false, voteAverage: 6.928, voteCount: 125)])
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        .colorScheme(.dark)
}
