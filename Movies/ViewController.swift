//
//  ViewController.swift
//  Movies
//
//  Created by Yasa, Tuba Nur on 17.05.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkService.shared.getMovies(completionHandler: (MovieResponseModel.self) -> Void)
    }


}

