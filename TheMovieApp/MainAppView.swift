//
//  ContentView.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 08/11/23.
//

import SwiftUI
import Foundation

struct MainAppView: View {
    
    @StateObject var viewModel = MovieViewViewModel(service: MovieService())
    
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        TabView {
            HomeView(viewModel: viewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            SearchView(viewModel: viewModel)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            WatchListView()
                .tabItem {
                    Label("Watch List", systemImage: "bookmark")
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MainAppView()
}
