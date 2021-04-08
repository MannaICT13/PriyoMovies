//
//  CastModel.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 8/4/21.
//

import UIKit

class CastModel: Decodable {
 
    let name:String
    let img :String
    
     init(name: String, img: String) {
        self.name = name
        self.img = img
    }
    
    private enum CodingKeys : String,CodingKey{
        
        case name = "original_name"
        case img = "profile_path"
    }
}
class CastResultModel : Decodable{
    
    var cast = [CastModel]()
    init(result : [CastModel]){
        
        self.cast = result
    }
    
    
}
