//
//  MovieModel.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 7/4/21.
//

import Foundation

struct MovieModel  {
    
    let results :[ResultsModel]
    
    private enum CodingKeys : String,CodingKey{
        case results = "results"
    }
    
}


struct ResultsModel{
    
    let id : Int
    let coverPhoto : String
    let poster : String
    let title : String
    let summary : String
    let rating : Double
    let releaseDate : String
   // let cast :[CustModel]
    
    private enum CodingKeys : String, CodingKey{
        
        case id,title
        case coverPhoto = "backdrop_path"
        case poster = "poster_path"
        case summary = "overview"
        case rating = "vote_average"
        case releaseDate = "release_date"
        
    }
    
    
    
   
}
