//
//  CustomTableViewCell.swift
//  Movies
//
//  Created by Yasa, Tuba Nur on 19.05.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieIMDBLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
