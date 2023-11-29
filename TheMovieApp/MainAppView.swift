//
//  ContentView.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 08/11/23.
//

import SwiftUI
import Foundation

struct MainAppView: View {
    
    @StateObject var homeViewViewModel = HomeViewViewModel(service: MovieService())
    
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        TabView {
            HomeView(viewModel: homeViewViewModel)
                .tabItem {
                    Label("home-title", systemImage: "house")
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            WatchListView()
                .tabItem {
                    Label("watchlist-title", systemImage: "bookmark")
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .colorScheme(.dark)
    }
}

#Preview {
    MainAppView()
}
