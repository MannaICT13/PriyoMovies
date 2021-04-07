//
//  ProfileViewController.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 7/4/21.
//

import UIKit

class ProfileViewController: UIViewController {

    
    
    //MARK:- Properties
    
    @IBOutlet weak var profileBackView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var profileLbl: UILabel!
    
    
    
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        profileLbl.text = "Profile"
        profileImg.roundImage(image: profileImg)
        profileBackView.backgroundColor = UtilityView.color
        userNameLbl.text = "Md Khaled Hasan Manna"

      
    }
    
    //MARK:- Handlers
    

 

}
