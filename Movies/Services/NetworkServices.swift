//
//  NetworkServices.swift
//  Movies
//
//  Created by Yasa, Tuba Nur on 18.05.2022.
//

import Foundation
import Alamofire

typealias Completion = () -> ()
typealias MovieCompletion = (MovieResponseModel) -> ()
typealias DataCompletion = (Data) -> ()

class NetworkService{
    static let shared = NetworkService()
    
    enum Constants {
        static let movieBaseURL = "https://api.themoviedb.org/3/movie/popular"
        static let apiKey = "api_key=9472b59c37b909f4e5c85b3fc12e9c3b"
        static let pageText = "&language=en-US&page="
        static let imageBaseURL = "https://image.tmdb.org/t/p/w500"
        
        static func getMoviesURL(pageNumber: Int = 1) -> String {
            return Constants.movieBaseURL + "?" + Constants.apiKey + Constants.pageText + "\(pageNumber)"
        }
    }
    
    init(){}
    
    
    func getMovies(page: Int = 1, completionHandler : @escaping MovieCompletion) {
        let request = Alamofire.request(Constants.getMoviesURL(pageNumber: page))
        request.responseJSON{ (response) in
            if let data = response.data{
                let movies = try? JSONDecoder().decode(MovieResponseModel.self, from : data)
                if let movies = movies {
                    completionHandler(movies)
                }
            }
        }
    }
    
    
    func getImage(_ path : String, completion : @escaping DataCompletion) {
        let url = Constants.imageBaseURL + "\(path)"
        let request = Alamofire.request(url)
        request.responseData { response in
            
            if let imageData = response.data {
                completion(imageData)
            }
        }
    }
}
