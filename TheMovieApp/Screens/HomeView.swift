//
//  HomeView.swift
//  TheMovieApp
//
//  Created by Joabe Santana Correia on 16/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewViewModel
    @Environment(\.managedObjectContext) private var viewContext
    
    init(viewModel: HomeViewViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: viewModel.columsGridItems, spacing: 16) {
                    ForEach(viewModel.listMovies(), id: \.id) { movie in
                        NavigationLink {
                            MovieDetailView(movie: movie)
                                .environment(\.managedObjectContext, viewContext)
                        } label: {
                            MovieCard(movie: movie)
                                .onAppear(perform: {
                                    if movie.id == viewModel.lastMovieId && viewModel.pageService <= viewModel.maxPagesService {
                                        viewModel.fetchMovies(page: viewModel.pageService)
                                    }
                                })
                        }
                    }
                }.padding()
            }
            .navigationTitle("home-title")
        }
        .accentColor(.white)
        .searchable(text: $viewModel.searchText , prompt: "search-label")
        .onAppear(perform: {
            viewModel.fetchMovies(page: viewModel.pageService)
        })
    }
}

fileprivate final class MovieServiceMock : MovieServiceable {
    func fetchMovieList(page: Int) async throws -> [Movie] {
        let jsonMovieString = """
                {
                  "dates": {
                    "maximum": "2023-11-22",
                    "minimum": "2023-10-11"
                  },
                  "page": 1,
                  "results": [
                    {
                      "adult": false,
                      "backdrop_path": "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg",
                      "genre_ids": [
                        27,
                        9648
                      ],
                      "id": 507089,
                      "original_language": "en",
                      "original_title": "Five Nights at Freddy's",
                      "overview": "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems.",
                      "popularity": 1617.893,
                      "poster_path": "/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg",
                      "release_date": "2023-10-25",
                      "title": "Five Nights at Freddy's",
                      "video": false,
                      "vote_average": 7.945,
                      "vote_count": 2324
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/kjQBrc00fB2RjHZB3PGR4w9ibpz.jpg",
                      "genre_ids": [
                        878,
                        28,
                        53
                      ],
                      "id": 670292,
                      "original_language": "en",
                      "original_title": "The Creator",
                      "overview": "Amid a future war between the human race and the forces of artificial intelligence, a hardened ex-special forces agent grieving the disappearance of his wife, is recruited to hunt down and kill the Creator, the elusive architect of advanced AI who has developed a mysterious weapon with the power to end the war—and mankind itself.",
                      "popularity": 1595.817,
                      "poster_path": "/vBZ0qvaRxqEhZwl6LWmruJqWE8Z.jpg",
                      "release_date": "2023-09-27",
                      "title": "The Creator",
                      "video": false,
                      "vote_average": 7.209,
                      "vote_count": 842
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/wl4NWiZwpzZH67HiDgpDImLyds9.jpg",
                      "genre_ids": [
                        28,
                        12,
                        53
                      ],
                      "id": 299054,
                      "original_language": "en",
                      "original_title": "Expend4bles",
                      "overview": "Armed with every weapon they can get their hands on and the skills to use them, The Expendables are the world’s last line of defense and the team that gets called when all other options are off the table. But new team members with new styles and tactics are going to give “new blood” a whole new meaning.",
                      "popularity": 1108.183,
                      "poster_path": "/iwsMu0ehRPbtaSxqiaUDQB9qMWT.jpg",
                      "release_date": "2023-09-15",
                      "title": "Expend4bles",
                      "video": false,
                      "vote_average": 6.408,
                      "vote_count": 753
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/5a4JdoFwll5DRtKMe7JLuGQ9yJm.jpg",
                      "genre_ids": [
                        28,
                        12,
                        878
                      ],
                      "id": 695721,
                      "original_language": "en",
                      "original_title": "The Hunger Games: The Ballad of Songbirds & Snakes",
                      "overview": "64 years before he becomes the tyrannical president of Panem, Coriolanus Snow sees a chance for a change in fortunes when he mentors Lucy Gray Baird, the female tribute from District 12.",
                      "popularity": 734.432,
                      "poster_path": "/mBaXZ95R2OxueZhvQbcEWy2DqyO.jpg",
                      "release_date": "2023-11-15",
                      "title": "The Hunger Games: The Ballad of Songbirds & Snakes",
                      "video": false,
                      "vote_average": 7.4,
                      "vote_count": 184
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/feSiISwgEpVzR1v3zv2n2AU4ANJ.jpg",
                      "genre_ids": [
                        28,
                        12,
                        878
                      ],
                      "id": 609681,
                      "original_language": "en",
                      "original_title": "The Marvels",
                      "overview": "Carol Danvers, aka Captain Marvel, has reclaimed her identity from the tyrannical Kree and taken revenge on the Supreme Intelligence. But unintended consequences see Carol shouldering the burden of a destabilized universe. When her duties send her to an anomalous wormhole linked to a Kree revolutionary, her powers become entangled with that of Jersey City super-fan Kamala Khan, aka Ms. Marvel, and Carol’s estranged niece, now S.A.B.E.R. astronaut Captain Monica Rambeau. Together, this unlikely trio must team up and learn to work in concert to save the universe.",
                      "popularity": 633.789,
                      "poster_path": "/Ag3D9qXjhJ2FUkrlJ0Cv1pgxqYQ.jpg",
                      "release_date": "2023-11-08",
                      "title": "The Marvels",
                      "video": false,
                      "vote_average": 6.5,
                      "vote_count": 438
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/dZbLqRjjiiNCpTYzhzL2NMvz4J0.jpg",
                      "genre_ids": [
                        27,
                        53
                      ],
                      "id": 951491,
                      "original_language": "en",
                      "original_title": "Saw X",
                      "overview": "Between the events of 'Saw' and 'Saw II', a sick and desperate John Kramer travels to Mexico for a risky and experimental medical procedure in hopes of a miracle cure for his cancer, only to discover the entire operation is a scam to defraud the most vulnerable. Armed with a newfound purpose, the infamous serial killer returns to his work, turning the tables on the con artists in his signature visceral way through devious, deranged, and ingenious traps.",
                      "popularity": 626.145,
                      "poster_path": "/aQPeznSu7XDTrrdCtT5eLiu52Yu.jpg",
                      "release_date": "2023-09-26",
                      "title": "Saw X",
                      "video": false,
                      "vote_average": 7.403,
                      "vote_count": 1079
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/pA3vdhadJPxF5GA1uo8OPTiNQDT.jpg",
                      "genre_ids": [
                        28,
                        18
                      ],
                      "id": 678512,
                      "original_language": "en",
                      "original_title": "Sound of Freedom",
                      "overview": "The story of Tim Ballard, a former US government agent, who quits his job in order to devote his life to rescuing children from global sex traffickers.",
                      "popularity": 614.334,
                      "poster_path": "/qA5kPYZA7FkVvqcEfJRoOy4kpHg.jpg",
                      "release_date": "2023-07-03",
                      "title": "Sound of Freedom",
                      "video": false,
                      "vote_average": 8.1,
                      "vote_count": 1473
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/zgQQF04u3OgNBJqClRNby1FPz9s.jpg",
                      "genre_ids": [
                        16,
                        10751,
                        28,
                        878
                      ],
                      "id": 893723,
                      "original_language": "en",
                      "original_title": "PAW Patrol: The Mighty Movie",
                      "overview": "A magical meteor crash lands in Adventure City and gives the PAW Patrol pups superpowers, transforming them into The Mighty Pups.",
                      "popularity": 540.935,
                      "poster_path": "/oJkyw6TNEWIS0WkrxNspJfUTao4.jpg",
                      "release_date": "2023-09-21",
                      "title": "PAW Patrol: The Mighty Movie",
                      "video": false,
                      "vote_average": 6.925,
                      "vote_count": 173
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/gN79aDbZdaSJkFS1iVA17HplF2X.jpg",
                      "genre_ids": [
                        27,
                        9648,
                        53
                      ],
                      "id": 968051,
                      "original_language": "en",
                      "original_title": "The Nun II",
                      "overview": "In 1956 France, a priest is violently murdered, and Sister Irene begins to investigate. She once again comes face-to-face with a powerful evil.",
                      "popularity": 520.807,
                      "poster_path": "/5gzzkR7y3hnY8AD1wXjCnVlHba5.jpg",
                      "release_date": "2023-09-06",
                      "title": "The Nun II",
                      "video": false,
                      "vote_average": 6.912,
                      "vote_count": 1425
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/drfl2eWipiibW3u3Ybx9HQ8VgIn.jpg",
                      "genre_ids": [
                        27,
                        9648,
                        53
                      ],
                      "id": 841742,
                      "original_language": "fr",
                      "original_title": "Megalomaniac",
                      "overview": "Felix and Martha, the two offspring of legendary serial murderer The Skinner of Mons, grapple with the grotesque legacy bequeathed to them. While Martha works a menial janitorial job, Felix continues his father's reign of terror. But following a brutal attack at work, Martha quickly descends into madness, finding she must come to terms with the infamous blood that flows through her veins.",
                      "popularity": 502.741,
                      "poster_path": "/eAx5QKnboZpysIg1XBfjhbSgOPF.jpg",
                      "release_date": "2023-09-08",
                      "title": "Megalomaniac",
                      "video": false,
                      "vote_average": 6.2,
                      "vote_count": 13
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/iiXliCeykkzmJ0Eg9RYJ7F2CWSz.jpg",
                      "genre_ids": [
                        28,
                        53,
                        80
                      ],
                      "id": 762430,
                      "original_language": "en",
                      "original_title": "Retribution",
                      "overview": "When a mysterious caller puts a bomb under his car seat, Matt Turner begins a high-speed chase across the city to complete a specific series of tasks- all with his kids trapped in the back seat.",
                      "popularity": 489.304,
                      "poster_path": "/oUmmY7QWWn7OhKlcPOnirHJpP1F.jpg",
                      "release_date": "2023-08-23",
                      "title": "Retribution",
                      "video": false,
                      "vote_average": 7,
                      "vote_count": 668
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/mRmRE4RknbL7qKALWQDz64hWKPa.jpg",
                      "genre_ids": [
                        80,
                        53
                      ],
                      "id": 800158,
                      "original_language": "en",
                      "original_title": "The Killer",
                      "overview": "After a fateful near-miss, an assassin battles his employers, and himself, on an international manhunt he insists isn't personal.",
                      "popularity": 447.212,
                      "poster_path": "/e7Jvsry47JJQruuezjU2X1Z6J77.jpg",
                      "release_date": "2023-10-25",
                      "title": "The Killer",
                      "video": false,
                      "vote_average": 6.758,
                      "vote_count": 771
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/azD31DjpV3PJfjF3h72LVw2WCSD.jpg",
                      "genre_ids": [
                        27
                      ],
                      "id": 807172,
                      "original_language": "en",
                      "original_title": "The Exorcist: Believer",
                      "overview": "When two girls disappear into the woods and return three days later with no memory of what happened to them, the father of one girl seeks out Chris MacNeil, who's been forever altered by what happened to her daughter fifty years ago.",
                      "popularity": 440.298,
                      "poster_path": "/fFXkAlMH2iQrNknv4eq7LGTkcti.jpg",
                      "release_date": "2023-10-04",
                      "title": "The Exorcist: Believer",
                      "video": false,
                      "vote_average": 6.146,
                      "vote_count": 575
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/45zVtZx6Tzx3RKeDziK25K9geFf.jpg",
                      "genre_ids": [
                        16,
                        10751,
                        10402,
                        14,
                        35
                      ],
                      "id": 901362,
                      "original_language": "en",
                      "original_title": "Trolls Band Together",
                      "overview": "When Branch’s brother, Floyd, is kidnapped for his musical talents by a pair of nefarious pop-star villains, Branch and Poppy embark on a harrowing and emotional journey to reunite the other brothers and rescue Floyd from a fate even worse than pop-culture obscurity.",
                      "popularity": 393.236,
                      "poster_path": "/lxoPJR6eR5nd6nHSKIkEIV4FQWe.jpg",
                      "release_date": "2023-10-12",
                      "title": "Trolls Band Together",
                      "video": false,
                      "vote_average": 6.585,
                      "vote_count": 47
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/tj7mp7uWjVw5N73G5Hwm1bkMOcD.jpg",
                      "genre_ids": [
                        28,
                        10752
                      ],
                      "id": 975902,
                      "original_language": "en",
                      "original_title": "Boudica",
                      "overview": "Inspired by events in A.D. 60, Boudica follows the eponymous Celtic warrior who rules the Iceni people alongside her husband Prasutagus. When he dies at the hands of Roman soldiers, Boudica’s kingdom is left without a male heir and the Romans seize her land and property.  Driven to the edge of madness and determined to avenge her husband’s death, Boudica rallies the various tribes from the region and wages an epic war against the mighty Roman empire.",
                      "popularity": 379.271,
                      "poster_path": "/adMcxfUonnm9RvPImGHy25wYUks.jpg",
                      "release_date": "2023-10-26",
                      "title": "Boudica",
                      "video": false,
                      "vote_average": 6.159,
                      "vote_count": 82
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/lyHmhoRj3zXSdeCYbs2oOXLCF4K.jpg",
                      "genre_ids": [
                        16,
                        12,
                        10751,
                        14
                      ],
                      "id": 459003,
                      "original_language": "uk",
                      "original_title": "Мавка: Лісова пісня",
                      "overview": "Forest soul Mavka faces an impossible choice between her heart and her duty as guardian to the Heart of the Forest, when she falls in love with the talented young human musician Lukas.",
                      "popularity": 367.772,
                      "poster_path": "/eeJjd9JU2Mdj9d7nWRFLWlrcExi.jpg",
                      "release_date": "2023-03-02",
                      "title": "Mavka: The Forest Song",
                      "video": false,
                      "vote_average": 7.268,
                      "vote_count": 503
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/iIvQnZyzgx9TkbrOgcXx0p7aLiq.jpg",
                      "genre_ids": [
                        27,
                        53
                      ],
                      "id": 1008042,
                      "original_language": "en",
                      "original_title": "Talk to Me",
                      "overview": "When a group of friends discover how to conjure spirits using an embalmed hand, they become hooked on the new thrill, until one of them goes too far and unleashes terrifying supernatural forces.",
                      "popularity": 357.992,
                      "poster_path": "/kdPMUMJzyYAc4roD52qavX0nLIC.jpg",
                      "release_date": "2023-07-26",
                      "title": "Talk to Me",
                      "video": false,
                      "vote_average": 7.196,
                      "vote_count": 1762
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/p9DKeXp6FPJtAQ1k13Z4zPWrCbN.jpg",
                      "genre_ids": [
                        18
                      ],
                      "id": 1058694,
                      "original_language": "en",
                      "original_title": "Radical",
                      "overview": "In a Mexican border town plagued by neglect, corruption, and violence, a frustrated teacher tries a radical new method to break through his students’ apathy and unlock their curiosity, their potential… and maybe even their genius.",
                      "popularity": 252.536,
                      "poster_path": "/eSatbygYZp8ooprBHZdb6GFZxGB.jpg",
                      "release_date": "2023-10-19",
                      "title": "Radical",
                      "video": false,
                      "vote_average": 7.273,
                      "vote_count": 11
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/cavK9ox37pxDg11RvJINMH63onU.jpg",
                      "genre_ids": [
                        27,
                        53
                      ],
                      "id": 744857,
                      "original_language": "es",
                      "original_title": "Cuando acecha la maldad",
                      "overview": "Residents of a small rural town discover that a demon is about to be born among them. They desperately try to escape before the evil is born, but it may be too late.",
                      "popularity": 248.36,
                      "poster_path": "/iQ7G9LhP7NRRIUM4Vlai3eOxBAc.jpg",
                      "release_date": "2023-10-05",
                      "title": "When Evil Lurks",
                      "video": false,
                      "vote_average": 7.333,
                      "vote_count": 216
                    },
                    {
                      "adult": false,
                      "backdrop_path": "/jP3FatCTHc460ZGW57q9ypTdBqu.jpg",
                      "genre_ids": [
                        53,
                        878,
                        28
                      ],
                      "id": 937249,
                      "original_language": "en",
                      "original_title": "57 Seconds",
                      "overview": "When a tech blogger lands an interview with a tech guru and stops an attack on him, he finds a mysterious ring that takes him back 57 seconds into the past.",
                      "popularity": 228.47,
                      "poster_path": "/dfS5qHWFuXyZQnwYREwb7N4qU5p.jpg",
                      "release_date": "2023-09-29",
                      "title": "57 Seconds",
                      "video": false,
                      "vote_average": 5.745,
                      "vote_count": 186
                    }
                  ],
                  "total_pages": 106,
                  "total_results": 2106
                }
            """
        
        guard let movieJsonData = jsonMovieString.data(using: .utf8) else {
            return []
        }
        
        let response = try JSONDecoder().decode(MovieResponse.self, from: movieJsonData)
        return response.results
    }
}

#Preview {
    HomeView(viewModel: HomeViewViewModel(service: MovieServiceMock()))
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        .colorScheme(.dark)
}
