//
//  UIImageView+Extensions.swift
//  Movies
//
//  Created by Yasa, Tuba Nur on 24.05.2022.
//

import Foundation
import UIKit

extension UIImageView {
    func setImage(_ path: String?) {
        if let path = path {
            NetworkService.shared.getImage(path) { dataImage in
                self.image = UIImage(data: dataImage)
            }
        }
    }
}

