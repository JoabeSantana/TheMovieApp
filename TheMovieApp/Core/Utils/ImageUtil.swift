//
//  ImageUtil.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 24/11/23.
//

import Foundation

final class ImageUtil {
    
    private static let baseUrl = "https://image.tmdb.org/t/p/"
    
    static func getImageUrl(path: String, size: Int = 200, original: Bool = false) -> String {
        if original {
            return baseUrl + "original/" + path
        } else {
            return baseUrl + "w\(size)/" + path
        }
    }
}
