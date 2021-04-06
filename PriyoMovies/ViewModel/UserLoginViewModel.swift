//
//  UserLoginViewModel.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 7/4/21.
//

import UIKit

class UserLoginViewModel: NSObject {
    
    let userName : String
    let password : String
    
    init(userLogin : UserLoginModel){
        self.userName = userLogin.userName
        self.password = userLogin.password
    }
    
    
    }
