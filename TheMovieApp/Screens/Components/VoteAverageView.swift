//
//  VoteAverageView.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 21/11/23.
//

import SwiftUI

struct VoteAverageView: View {
    
    let voteAverage: Double
    
    var body: some View {
        HStack {
            Spacer()
            Text("\(Image(systemName: "star")) \(voteAverage, specifier: "%.2f")")
                .padding(EdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 15))
                .background(Color(red: 36.0/255, green: 42.0/255, blue: 50.0/255))
                .clipShape(.capsule)
                .foregroundStyle(.orange)
                .bold()
        }
    }
}

#Preview {
    VoteAverageView(voteAverage: 7.88)
}
