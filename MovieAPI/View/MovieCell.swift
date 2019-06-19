//
//  MovieCell.swift
//  MovieAPI
//
//  Created by hyunsu on 2019/06/20.
//  Copyright © 2019 hyunsu.park. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    
    
    @IBOutlet weak var movieTItleLabel: UILabel!
    @IBOutlet weak var movieAudiLabel: UILabel!
    @IBOutlet weak var movieSalesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(movieList : MovieApi){
        movieTItleLabel.text = "\(movieList.title)"
        
        movieAudiLabel.text =  "\(movieList.audi) 명"
        movieSalesLabel.text = "\(movieList.sales) 원"
    }
}
