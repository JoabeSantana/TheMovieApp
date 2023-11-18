//
//  RoundedCornersModifier.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 18/11/23.
//

import SwiftUI

struct RoundedCorners: ViewModifier {
    
    let topLeadingRadius: CGFloat
    let bottomLeadingRadius: CGFloat
    let bottomTrailingRadius: CGFloat
    let topTrailingRadius: CGFloat
    
    func body(content: Content) -> some View {
        content.clipShape(.rect(topLeadingRadius: topLeadingRadius, bottomLeadingRadius: bottomLeadingRadius, bottomTrailingRadius: bottomTrailingRadius, topTrailingRadius: topTrailingRadius))
    }
}
