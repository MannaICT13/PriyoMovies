//
//  UserModel.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 7/4/21.
//

import UIKit

class UserModel: NSObject {
    
    let img : String
    let name : String
    let userName : String
    let password : String
    
     init(img:String,name:String,userName : String,password:String) {
        self.img = img
        self.name = name
        self.userName = userName
        self.password = password
    }
    
    

}
