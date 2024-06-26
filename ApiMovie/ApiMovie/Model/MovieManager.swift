//
//  MovieManager.swift
//  ApiMovie
//
//  Created by Mohit Kumar Gupta on 20/04/24.
//

import UIKit

struct MovieManager{
    
    func fetchMovies(completion: @escaping(MovieModel) -> Void){
        
        guard let url = URL(string: "https://reactnative.dev/movies.json") else{
            
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error{
                
                print("Error fetching movies \(error.localizedDescription)")
            }
            
            guard let jsonData = data else{
                return
            }
            
            let decoder = JSONDecoder()
            
            do{
                
                let decodedData = try decoder.decode(MovieModel.self, from: jsonData)
                
                completion(decodedData)
                
            }catch{
                
            }
        }
        
        
        dataTask.resume()
    }
}

