//
//  TabBarController.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 7/4/21.
//

import UIKit

class TabBarController: UITabBarController {

    var userName = String()
    var userVM = [UserViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationItem.setHidesBackButton(true, animated: true)
        UserService.shareInstance.getUserData(userName: userName) { (user) in
            
            self.userVM = user.map({return UserViewModel(user: $0)}) 
        
        }
        
    }
    

   

}
