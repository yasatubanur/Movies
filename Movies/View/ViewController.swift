//
//  ViewController.swift
//  Movies
//
//  Created by Yasa, Tuba Nur on 17.05.2022.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var movieTableView: UITableView!
    
    let viewModel: HomeViewModel = .init() //for object initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.downloadMovies {
            self.movieTableView.reloadData()
        }
    }
    
}


//MARK: setup tableView
extension ViewController {
    func setupTableView() {
        self.movieTableView.dataSource = self
        self.movieTableView.delegate = self
        movieTableView.register(UINib(nibName: CustomTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
}


//MARK: tableView delegation
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let intTotalRow = tableView.numberOfRows(inSection: indexPath.section)
        
        if indexPath.row == intTotalRow - 1 {
            if intTotalRow % 20 == 0 {
                viewModel.downloadMovies {
                    self.movieTableView.reloadData()
                }
            }
        }
    }
}
