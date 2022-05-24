//
//  HomeViewModel.swift
//  Movies
//
//  Created by Yasa, Tuba Nur on 24.05.2022.
//

import Foundation

class HomeViewModel: NSObject {
    private var movie : MovieResponseModel?
    
    func downloadMovies(completion: @escaping () -> ()) {
        NetworkService.shared.getMovies (completionHandler: { movieModel in
            self.movie  = movieModel
            completion()
        })
    }
    
    func getCellCount() -> Int {
        return movie?.results?.count ?? 0
    }
    
    func getMovieName(index: IndexPath) -> String {
        return movie?.results?[index.row].title ?? ""
    }
    
    func getOverviewName(index: IndexPath) -> String {
        return movie?.results?[index.row].overview ?? ""
    }
    
    func getVoteAverage(index: IndexPath) -> String {
        return "\(movie?.results?[index.row].voteAverage ?? 0) / 10"
    }
    
    func getImagePath(index: IndexPath) -> String? {
        return movie?.results?[index.row].posterPath
    }
}
