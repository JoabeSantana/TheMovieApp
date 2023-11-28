//
//  PosterImageTitleView.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 27/11/23.
//

import SwiftUI

struct PosterImageTitleView : View {
    
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .bottom) {
            
            NavigationStack {
                NavigationLink {
                    FullImageView(url: ImageUtil.getImageUrl(path: movie.posterPath, original: true))
                        .background(Color(red: 36.0/255, green: 42.0/255, blue: 50.0/255))
                } label: {
                    PosterImageView(imageUrl: ImageUtil.getImageUrl(path: movie.posterPath))
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(.orange, lineWidth: 2))
                }

            }
            
            VStack() {
                Text(movie.title)
                    .font(.system(size: 24))
                    .bold()
                    .foregroundStyle(.white)
                    .lineLimit(2)
            }
            .frame(maxWidth: .infinity, maxHeight: 75, alignment: .leading)
            
        }
    }
}
