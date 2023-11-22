//
//  Movie.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 13/11/23.
//

import Foundation

struct Movie: Decodable {
    
    internal init(adult: Bool, backdrop_path: String? = nil, id: Int, original_language: String, original_title: String, overview: String, popularity: Double, poster_path: String? = nil, release_date: Date, title: String, video: Bool, vote_average: Double, vote_count: Int) {
        self.adult = adult
        self.backdrop_path = backdrop_path
        self.id = id
        self.original_language = original_language
        self.original_title = original_title
        self.overview = overview
        self.popularity = popularity
        self.poster_path = poster_path
        self.release_date = release_date
        self.title = title
        self.video = video
        self.vote_average = vote_average
        self.vote_count = vote_count
    }
    
//    internal init(adult: Bool, backdrop_path: String, id: Int, original_language: String, original_title: String, overview: String, popularity: Double, poster_path: String, release_date: Date, title: String, video: Bool, vote_average: Double, vote_count: Int) {
//        self.adult = adult
//        self.backdrop_path = backdrop_path
//        self.id = id
//        self.original_language = original_language
//        self.original_title = original_title
//        self.overview = overview
//        self.popularity = popularity
//        self.poster_path = poster_path
//        self.release_date = release_date
//        self.title = title
//        self.video = video
//        self.vote_average = vote_average
//        self.vote_count = vote_count
//    }
    
    let adult: Bool
    let backdrop_path: String?
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String?
    let release_date: Date
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
    let baseUrlImagePath: String = "https://image.tmdb.org/t/p/w500/"
    
    
    enum CodingKeys: CodingKey {
        case adult
        case backdrop_path
        case id
        case original_language
        case original_title
        case overview
        case popularity
        case poster_path
        case release_date
        case title
        case video
        case vote_average
        case vote_count
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adult = try container.decode(Bool.self, forKey: .adult)
        self.backdrop_path = try container.decodeIfPresent(String.self, forKey: .backdrop_path)
        self.id = try container.decode(Int.self, forKey: .id)
        self.original_language = try container.decode(String.self, forKey: .original_language)
        self.original_title = try container.decode(String.self, forKey: .original_title)
        self.overview = try container.decode(String.self, forKey: .overview)
        self.popularity = try container.decode(Double.self, forKey: .popularity)
        self.poster_path = try container.decodeIfPresent(String.self, forKey: .poster_path)
        let date = try container.decode(String.self, forKey: .release_date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.release_date = dateFormatter.date(from: date) ?? Date()
        self.title = try container.decode(String.self, forKey: .title)
        self.video = try container.decode(Bool.self, forKey: .video)
        self.vote_average = try container.decode(Double.self, forKey: .vote_average)
        self.vote_count = try container.decode(Int.self, forKey: .vote_count)
    }
    
    func getPosterPath() -> String {
        guard let postePath = self.poster_path else {
            return ""
        }
        return self.baseUrlImagePath + postePath
    }
    
    func getBackdropPath() -> String {
        guard let backdropPath = self.backdrop_path else {
            return ""
        }
        return self.baseUrlImagePath + backdropPath
    }
}
