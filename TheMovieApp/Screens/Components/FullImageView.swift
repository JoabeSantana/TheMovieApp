//
//  FullImageView.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 27/11/23.
//

import SwiftUI

struct FullImageView: View {
    
    let url: String
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: url)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.primaryApp))
    }
}
