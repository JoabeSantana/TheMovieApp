# SwiftUI App to consume TMDB Api - MVVM

A SwiftUI iOS project using MVVM design pattern to show Movies that is now playing and their information.

Project format: Xcode 14.0

To run this App you need to get a valid TMDB Access Token Auth from https://developer.themoviedb.org/docs and replace the content in the MovieService class:

let headers = [
          "accept": "application/json",
          "Authorization": "Bearer YOUR-TMDB-ACCESS-TOKEN-AUTH"
        ]

For information about the API you can follow these links:

https://developer.themoviedb.org/docs
https://developer.themoviedb.org/reference/intro/getting-started