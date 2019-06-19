//
//  ViewController.swift
//  MovieAPI
//
//  Created by hyunsu on 2019/06/20.
//  Copyright © 2019 hyunsu.park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var movieList : [MovieApi] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MovieCell else {
            return UITableViewCell() }
        
        cell.movieTItleLabel.text = "\(self.movieList[indexPath.row].title)"
        
        cell.movieAudiLabel.text =  "\(movieList[indexPath.row].audi) 명"
        cell.movieSalesLabel.text = "\(movieList[indexPath.row].sales) 원"
        print(movieList[indexPath.row].code)
        
        return cell
    }
        
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
}

extension ViewController : UITableViewDelegate{
    
}
