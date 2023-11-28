//
//  Persistence.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 26/11/23.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<10 {
            let movie = MovieEntity(context: viewContext)
            movie.id = i
            movie.adult = false
            movie.backdropPath = "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg"
            movie.originalLanguage = "Eng"
            movie.originalTitle = "Teste"
            movie.overview = "Teste Teste Teste"
            movie.popularity = 9.26
            movie.posterPath = "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg"
            movie.releaseDate = Date()
            movie.title = "Title\(i)"
            movie.video = false
            movie.voteAverage = 9.6
            movie.voteCount = 2367
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TheMovieApp")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
