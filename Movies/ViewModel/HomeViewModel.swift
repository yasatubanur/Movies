//
//  HomeViewModel.swift
//  Movies
//
//  Created by Yasa, Tuba Nur on 24.05.2022.
//

import Foundation

class HomeViewModel: NSObject {
    private var movie : MovieResponseModel?
    
    private var current_page = 0
    
    func downloadMovies(completion: @escaping () -> ()) {
        current_page += 1
        NetworkService.shared.getMovies (page: current_page, completionHandler: { movieModel in
            if self.movie == nil {
                self.movie = movieModel
            }else if let newMovies = movieModel.results{
                self.movie?.results?.append(contentsOf: newMovies)
            }
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
    
    func getMovieModel(index: IndexPath) -> MovieDetailModel? {
        return movie?.results?[index.row]
    }
}
