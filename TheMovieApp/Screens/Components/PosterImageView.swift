//
//  PosterImageView.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 21/11/23.
//

import SwiftUI

struct PosterImageView: View {
    
    let imageUrl: String
    
    private let colorTemplate = Color(red: 57.0/255, green: 59.0/255, blue: 70.0/255)
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { imagePhase in
            switch imagePhase {
            case let .success(image) :
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .roundedCorners()
            case .empty:
                ZStack {
                    Image("PosterTemplate")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .background(colorTemplate)
                        .roundedCorners()
                    ProgressView().frame(maxWidth: 10)
                }
            case .failure(_):
                ZStack {
                    Image("PosterTemplate")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .background(colorTemplate)
                    .roundedCorners()
                    Image(systemName: "rectangle.slash")
                        .foregroundStyle(.white)
                }
            @unknown default:
                Image("PosterTemplate")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(colorTemplate)
                    .roundedCorners()
            }
        }
    }
}
