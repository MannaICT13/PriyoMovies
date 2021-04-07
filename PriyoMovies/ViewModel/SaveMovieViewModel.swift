//
//  SaveMovieViewModel.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 8/4/21.
//

import UIKit

class SaveMovieViewModel: NSObject {

    
    let title : String
    let img : String
    
    init(result : SaveMovieModel) {
        self.title = result.title
        self.img = result.img
    }
}
