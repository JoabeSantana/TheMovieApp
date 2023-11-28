//
//  BackdropImageView.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 21/11/23.
//

import SwiftUI

struct BackdropImageView: View {
    
    let imageUrl: String
    
    var topLeadingRadius: CGFloat = 0
    var bottomLeadingRadius: CGFloat = 0
    var bottomTrailingRadius: CGFloat = 0
    var topTrailingRadius: CGFloat = 0
    
    private let templateColor = ColorUtil.templateColor
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: imageUrl)) { imagePhase in
                switch imagePhase {
                case let .success(image) :
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .roundedCorners(topLeadingRadius: topLeadingRadius, bottomLeadingRadius: bottomLeadingRadius, bottomTrailingRadius: bottomTrailingRadius, topTrailingRadius: topTrailingRadius)
                case .empty:
                    ZStack {
                        Image("BackdropTemplate")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .background(templateColor)
                            .roundedCorners(topLeadingRadius: topLeadingRadius, bottomLeadingRadius: bottomLeadingRadius, bottomTrailingRadius: bottomTrailingRadius, topTrailingRadius: topTrailingRadius)
                        ProgressView().frame(maxWidth: 10, maxHeight: 10)
                    }
                case .failure(_):
                    ZStack {
                        Image("BackdropTemplate")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .background(templateColor)
                            .roundedCorners(topLeadingRadius: topLeadingRadius, bottomLeadingRadius: bottomLeadingRadius, bottomTrailingRadius: bottomTrailingRadius, topTrailingRadius: topTrailingRadius)
                        Image(systemName: "rectangle.slash")
                            .foregroundStyle(.white)
                    }
                @unknown default:
                    Image("BackdropTemplate")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .background(templateColor)
                        .roundedCorners(topLeadingRadius: topLeadingRadius, bottomLeadingRadius: bottomLeadingRadius, bottomTrailingRadius: bottomTrailingRadius, topTrailingRadius: topTrailingRadius)
                }
            }
        }
    }
}

#Preview {
    BackdropImageView(imageUrl: "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg")
}
