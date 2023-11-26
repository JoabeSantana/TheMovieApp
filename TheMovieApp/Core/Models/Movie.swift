//
//  Movie.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 13/11/23.
//

import Foundation

struct Movie: Decodable {
    
    internal init(id: Int,adult: Bool, backdropPath: String, originalLanguage: String, originalTitle: String, overview: String, popularity: Double, posterPath: String, releaseDate: Date, title: String, video: Bool, voteAverage: Double, voteCount: Int) {
        self.id = id
        self.adult = adult
        self.backdropPath = backdropPath
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
    
    let id: Int
    let adult: Bool
    let backdropPath: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: Date
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    //let baseUrlImagePath: String = "https://image.tmdb.org/t/p/original/"
    
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adult = try container.decode(Bool.self, forKey: .adult)
        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath) ?? ""
        self.id = try container.decode(Int.self, forKey: .id)
        self.originalLanguage = try container.decode(String.self, forKey: .originalLanguage)
        self.originalTitle = try container.decode(String.self, forKey: .originalTitle)
        self.overview = try container.decode(String.self, forKey: .overview)
        self.popularity = try container.decode(Double.self, forKey: .popularity)
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
        let date = try container.decode(String.self, forKey: .releaseDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.releaseDate = dateFormatter.date(from: date) ?? Date()
        self.title = try container.decode(String.self, forKey: .title)
        self.video = try container.decode(Bool.self, forKey: .video)
        self.voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        self.voteCount = try container.decode(Int.self, forKey: .voteCount)
    }
    
//    func getPosterPath() -> String {
//        guard let postePath = self.poster_path else {
//            return ""
//        }
//        return self.baseUrlImagePath + postePath
//    }
//    
//    func getBackdropPath() -> String {
//        guard let backdropPath = self.backdrop_path else {
//            return ""
//        }
//        return self.baseUrlImagePath + backdropPath
//    }
}
