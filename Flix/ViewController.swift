//
//  ViewController.swift
//  Flix
//
//  Created by Subash Bhusal on 2/22/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var flixTableView: UITableView!
    
    private var movies = [Movie]() {
        didSet {
            flixTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        flixTableView.dataSource = self
        flixTableView.delegate = self
        FlixService.shared.fetchMovies { movies in
            self.movies = movies
        }
        
        
        print("Hello")
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FlixTableViewCell")  as? FlixTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    


}

