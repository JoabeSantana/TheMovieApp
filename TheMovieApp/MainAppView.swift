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
                    Label("Home", systemImage: "house")
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            WatchListView()
                .tabItem {
                    Label("Watch List", systemImage: "bookmark")
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .colorScheme(.dark)
    }
}

#Preview {
    MainAppView()
}
