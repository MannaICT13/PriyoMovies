//
//  CastViewModel.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 8/4/21.
//

import UIKit

class CastViewModel: NSObject {
    
    let name:String
    let img :String
    
    init(result:CastModel) {
        self.name = result.name
        self.img = result.img
    }
}
