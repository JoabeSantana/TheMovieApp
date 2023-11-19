//
//  ContentView.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 08/11/23.
//

import SwiftUI
import Foundation

struct MainAppView: View {
    
    var body: some View {
        TabView {
            HomeView(movieService: MovieService())
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SearchView()
                .tabItem {
                    Label("Seach", systemImage: "magnifyingglass")
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
