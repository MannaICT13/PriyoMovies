//
//  PopularMovieViewModel.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 8/4/21.
//

import UIKit

class PopularMovieViewModel: NSObject {
    
    
    let id : Int
    let coverPhoto : String
    let poster : String
    let title : String
    let summary : String
    let rating : Double
    let releaseDate : String
   // let cast :[CustModel]
    
    init(result : PopularMovieModel) {
        
        self.id = result.id
        self.coverPhoto = result.coverPhoto
        self.poster = result.poster
        self.title = result.title
        self.summary = result.summary
        self.rating = result.rating
        self.releaseDate = result.releaseDate
        
        
        
    }

    
    
}
