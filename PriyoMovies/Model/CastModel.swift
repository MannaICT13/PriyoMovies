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
    
    enum CodingKeys : String,CodingKey{
        
        case name
        case img = "profile_path"
    }
}
class CastResultModel : Decodable{
    
    let cast : [CastModel]
    init(result : [CastModel]){
        
        self.cast = result
    }
    
    
}
