//
//  FavouriteMovieViewModel.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 8/4/21.
//

import UIKit

class FavouriteMovieViewModel: NSObject {

    let title :String
    let img : String
    
    init(result : FavouriteMovieModel) {
        self.title = result.title
        self.img = result.img
    }
    
    
}
