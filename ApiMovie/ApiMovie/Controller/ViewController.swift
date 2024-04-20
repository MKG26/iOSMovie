//
//  ViewController.swift
//  ApiMovie
//
//  Created by Mohit Kumar Gupta on 20/04/24.
//

import UIKit

class ViewController: UITableViewController {

    
    let reuseIdentifier = "MovieCell"
    
    var myMovies: [Movies]?{
        didSet{
            
            DispatchQueue.main.async{ [self] in
                tableView.reloadData()
                
            }
            
            
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        
        configureTableView()
        let movieManager = MovieManager()
        
        movieManager.fetchMovies{ (movies) in 
            
            DispatchQueue.main.async{ [self] in
                navigationItem.title = movies.title
                
            }
            
             
            self.myMovies = movies.movies
            
        }
    }

    
    
    func configureTableView(){
        
        tableView.backgroundColor = .lightGray
        
        tableView.tableFooterView = UIView()
    }

}

extension ViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMovies?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        guard let movie = myMovies?[indexPath.row] else{
            return UITableViewCell()
        }
        
        cell.textLabel?.text = "\(movie.title) -- \(movie.releaseYear)"
        
        return cell
    }
    
}

