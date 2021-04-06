//
//  UserViewModel.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 7/4/21.
//

import UIKit
import Foundation
class UserViewModel: NSObject {
    
    let img : String
    let name : String
    let userName : String
    let password : String
    
    init(user : UserModel) {
        self.img = user.img
        self.name = user.name
        self.userName = user.userName
        self.password = user.password
    }
  
    

}
