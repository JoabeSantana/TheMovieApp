//
//  TheMovieAppApp.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 08/11/23.
//

import SwiftUI

@main
struct TheMovieApp: App {
    
    init(){
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some Scene {
        WindowGroup {
            MainAppView()
        }
    }
}
