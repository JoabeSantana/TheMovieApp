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
        UIScrollView.appearance().backgroundColor = UIColor(ColorUtil.primaryColor)
    }
    
    var body: some Scene {
        WindowGroup {
            MainAppView()
        }
    }
}
