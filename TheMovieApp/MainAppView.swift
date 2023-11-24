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
    
    var body: some View {
        TabView {
            HomeView(viewModel: viewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SearchView(viewModel: viewModel)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            WatchListView()
                .tabItem {
                    Label("Watch List", systemImage: "bookmark")
                }
        }
        .colorScheme(.dark)
    }
}

#Preview {
    MainAppView()
}
