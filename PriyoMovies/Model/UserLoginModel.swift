//
//  UserLoginModel.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 7/4/21.
//

import UIKit

class UserLoginModel: NSObject {

    let userName : String
    let password : String
    
    init(userName: String,password:String) {
        self.userName = userName
        self.password = password
        
    }
    
}
