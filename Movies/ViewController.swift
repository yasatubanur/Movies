//
//  ViewController.swift
//  Movies
//
//  Created by Yasa, Tuba Nur on 17.05.2022.
// https://image.tmdb.org/t/p/w500/tlZpSxYuBRoVJBOpUrPdQe9FmFq.jpg

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var movie : MovieResponseModel?
    
    @IBOutlet var movieTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      //  overrideUserInterfaceStyle = .dark
        
        NetworkService.shared.getMovies { [self] movieModel in
            self.movie  = movieModel
            movieTableView.reloadData()
        }
        
        self.movieTableView.dataSource = self
        self.movieTableView.delegate = self
        
        self.registerTableViewCell()
    }
    
    func registerTableViewCell(){
        let movieNameField = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.movieTableView.register(movieNameField, forCellReuseIdentifier: "CustomTableViewCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movie = movie else { return 3 }
            return movie.results!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = movieTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell {
            let mov = movie?.results
            cell.movieNameLabel.text = mov?[indexPath.row].title
            cell.movieOverviewLabel.text = mov?[indexPath.row].overview
            cell.movieIMDBLabel.text = "\(mov?[indexPath.row].voteAverage ?? 0) / 10"
            cell.movieImageView.setImage(mov?[indexPath.row].posterPath)
            return cell
        }
        return UITableViewCell()
    }
}

