//
//  MovieViewModel.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 7/4/21.
//

import Foundation

struct MovieViewModel {
    
    let results :[ResultsModel]
    
    init(results : MovieModel) {
        self.results = results.results
    }
    
    
}
