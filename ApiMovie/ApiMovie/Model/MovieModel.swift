//
//  MovieModel.swift
//  ApiMovie
//
//  Created by Mohit Kumar Gupta on 20/04/24.
//

import Foundation

struct MovieModel: Decodable{
    
    let title: String
    let description: String
    
    let movies: [Movies]
}


struct Movies : Decodable{
    
    let id : String
    let title: String
    let releaseYear: String
}
