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
        
        UIScrollView.appearance().backgroundColor = UIColor(Color(red: 36.0/255, green: 42.0/255, blue: 50.0/255))
    }
    
    var body: some Scene {
        WindowGroup {
            MainAppView()
        }
    }
}
