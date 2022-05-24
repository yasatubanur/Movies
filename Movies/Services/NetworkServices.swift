//
//  NetworkServices.swift
//  Movies
//
//  Created by Yasa, Tuba Nur on 18.05.2022.
//

import Foundation
import Alamofire

class NetworkService{
    static let shared = NetworkService()
    
    init(){}
    
    
    func getMovies(completionHandler : @escaping (MovieResponseModel) -> Void) {
        let request = Alamofire.request("https://api.themoviedb.org/3/movie/popular?api_key=9472b59c37b909f4e5c85b3fc12e9c3b&language=en-US&page=1")
        request.responseJSON{
            (response) in
           // print(response)
            if let data = response.data{
                let movies = try? JSONDecoder().decode(MovieResponseModel.self, from : data)
                //print(movies?.results?[1].title)
                
                if let movies = movies {
                    completionHandler(movies)
                }
            }
        }
    }
    
    
    func getImage(_ path : String, completion : @escaping (Data) -> ()) {
        let url = "https://image.tmdb.org/t/p/w500" + "\(path)"
        let request = Alamofire.request(url)
        request.responseData { response in
            
            if let imageData = response.data {
                completion(imageData)
            }
        }
    }
}
