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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
