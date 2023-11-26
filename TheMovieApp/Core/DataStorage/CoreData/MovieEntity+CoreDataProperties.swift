//
//  MovieEntity+CoreDataProperties.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 26/11/23.
//
//

import Foundation
import CoreData


extension MovieEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieEntity> {
        return NSFetchRequest<MovieEntity>(entityName: "MovieEntity")
    }

    @NSManaged public var adult: Bool
    @NSManaged public var backdropPath: String
    @NSManaged public var id: Int
    @NSManaged public var originalLanguage: String
    @NSManaged public var originalTitle: String
    @NSManaged public var overview: String
    @NSManaged public var popularity: Double
    @NSManaged public var posterPath: String
    @NSManaged public var releaseDate: Date
    @NSManaged public var title: String
    @NSManaged public var video: Bool
    @NSManaged public var voteAverage: Double
    @NSManaged public var voteCount: Int

}

extension MovieEntity : Identifiable {

}
