//
//  FlixTableViewCell.swift
//  Flix
//
//  Created by Subash Bhusal on 2/22/22.
//

import UIKit
import AlamofireImage

class FlixTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var flixImageView: UIImageView!
    
    
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        descriptionLabel.text = movie.description
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterUrl = baseUrl + movie.posterURL
        flixImageView.af.setImage(withURL: URL(string: posterUrl)!)
        
    }

}
