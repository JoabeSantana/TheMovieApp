//
//  PosterImageView.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 21/11/23.
//

import SwiftUI

struct PosterImageView: View {
    
    let imageUrl: String
    
    private let templateColor = Color(.templateApp)
    
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
                        .background(templateColor)
                        .roundedCorners()
                    ProgressView().frame(maxWidth: 10)
                }
            case .failure(_):
                ZStack {
                    Image("PosterTemplate")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .background(templateColor)
                    .roundedCorners()
                    Image(systemName: "rectangle.slash")
                        .foregroundStyle(.white)
                }
            @unknown default:
                Image("PosterTemplate")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(templateColor)
                    .roundedCorners()
            }
        }
    }
}

#Preview {
    PosterImageView(imageUrl: "")
}
