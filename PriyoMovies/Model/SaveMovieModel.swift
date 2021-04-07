//
//  SaveMovieModel.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 8/4/21.
//

import UIKit

class SaveMovieModel: NSObject {
 
    
    let title : String
    let img : String
    
   init(title: String, img: String) {
        self.title = title
        self.img = img
    }
    
}
