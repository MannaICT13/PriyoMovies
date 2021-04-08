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
    var popularMVM = [PopularMovieViewModel]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        SaveMovieService.sharedInstance.openConnection(userName: userName)
        SaveMovieService.sharedInstance.createTable(userName: userName)
       // self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationItem.setHidesBackButton(true, animated: true)

        let profileTab = self.viewControllers![2] as! ProfileViewController
        profileTab.userName = userName
        
        let favouriteTab = self.viewControllers![1] as! FavouriteViewController
        favouriteTab.userName = userName
        
        let popularTab = self.viewControllers![0] as! PopularMovieViewController
        popularTab.userName = userName
        
        MovieService.sharedInstance.getPopularMovie { (results) in
        
            self.popularMVM = results.map({return PopularMovieViewModel(result: $0)})
            
        }

        
        
        
        
    }
    
    
   
   

}
