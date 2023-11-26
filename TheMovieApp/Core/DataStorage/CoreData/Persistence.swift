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
        for _ in 0..<10 {
            let movie = MovieEntity(context: viewContext)
            movie.id = Int.random(in: 1..<1000)
            movie.adult = false
            movie.backdropPath = "https://image.tmdb.org/t/p/w500/zgQQF04u3OgNBJqClRNby1FPz9s.jpg"
            movie.originalLanguage = "Eng"
            movie.originalTitle = "Teste"
            movie.overview = "Teste Teste Teste"
            movie.popularity = 9.26
            movie.posterPath = "https://image.tmdb.org/t/p/w500/aTvePCU7exLepwg5hWySjwxojQK.jpg"
            movie.releaseDate = Date()
            movie.title = "Title"
            movie.video = false
            movie.voteAverage = 9.6
            movie.voteCount = 2367
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
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
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to p ermissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
