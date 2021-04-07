//
//  PopularMovieModel.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 8/4/21.
//

import UIKit

class PopularMovieModel: Decodable {
    
  

    let id : Int
    let coverPhoto : String
    let poster : String
    let title : String
    let summary : String
    let rating : Double
    let releaseDate : String
   // let cast :[CustModel]
    

    
    init(id: Int, coverPhoto: String, poster: String, title: String, summary: String, rating: Double, releaseDate: String) {
        self.id = id
        self.coverPhoto = coverPhoto
        self.poster = poster
        self.title = title
        self.summary = summary
        self.rating = rating
        self.releaseDate = releaseDate
    }
    
    
    private enum CodingKeys : String, CodingKey{
        
        case id,title
        case coverPhoto = "backdrop_path"
        case poster = "poster_path"
        case summary = "overview"
        case rating = "vote_average"
        case releaseDate = "release_date"
        
    }
    
    
    
}

class ResultModel: Decodable{
    
    var results = [PopularMovieModel]()
    
    init(results: [PopularMovieModel]) {
        self.results = results
    }
    
}
