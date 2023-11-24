//
//  ViewExtension.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 18/11/23.
//

import SwiftUI

extension View {
    func roundedCorners(topLeadingRadius: CGFloat = 20, bottomLeadingRadius: CGFloat = 20, bottomTrailingRadius: CGFloat = 20, topTrailingRadius: CGFloat = 20) -> some View {
        modifier(RoundedCorners(topLeadingRadius: topLeadingRadius, bottomLeadingRadius: bottomLeadingRadius, bottomTrailingRadius: bottomTrailingRadius, topTrailingRadius: topTrailingRadius))
    }
}
