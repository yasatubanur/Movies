//
//  DetialViewController.swift
//  Movies
//
//  Created by Yasa, Tuba Nur on 24.05.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieOverview: UILabel!
    
    var movieModel: MovieDetailModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieImage.setImage(movieModel?.posterPath)
        movieOverview.text = movieModel?.overview
    }
}
