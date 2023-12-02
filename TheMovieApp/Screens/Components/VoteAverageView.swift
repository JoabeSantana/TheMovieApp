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
                .background(.primaryApp)
                .clipShape(.capsule)
                .foregroundStyle(.orange)
                .bold()
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: -60, trailing: 5))
        .offset(x: 0, y: -51)
    }
}

#Preview {
    VoteAverageView(voteAverage: 7.88)
}
