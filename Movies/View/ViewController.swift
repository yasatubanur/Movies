//
//  ViewController.swift
//  Movies
//
//  Created by Yasa, Tuba Nur on 17.05.2022.

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var movieTableView: UITableView!
    
    let viewModel: HomeViewModel = .init() //for object initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  overrideUserInterfaceStyle = .dark
        
        viewModel.downloadMovies {
            self.movieTableView.reloadData()
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
        return viewModel.getCellCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = movieTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell {
            cell.movieNameLabel.text = viewModel.getMovieName(index: indexPath)
            cell.movieOverviewLabel.text = viewModel.getOverviewName(index: indexPath)
            cell.movieIMDBLabel.text = viewModel.getVoteAverage(index: indexPath)
            cell.movieImageView.setImage(viewModel.getImagePath(index: indexPath))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailViewController()
        vc.movieModel = viewModel.getMovieModel(index: indexPath)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

