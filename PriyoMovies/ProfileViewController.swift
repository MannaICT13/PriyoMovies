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
    
    
    var userName = String()
    var userVM = [UserViewModel]()
    
    //MARK:- Init
    override func viewDidLoad() {
        
        super.viewDidLoad()
                UserService.shareInstance.getUserData(userName: userName) { (user) in
        
                    self.userVM = user.map({return UserViewModel(user: $0)})
        
                }
    
        let imgStr = userVM[0].img
        let dataDecoded:NSData = NSData(base64Encoded: imgStr, options: NSData.Base64DecodingOptions(rawValue: 0))!
        let data = Data(base64Encoded: dataDecoded as Data,options: .ignoreUnknownCharacters)
        
        profileLbl.text = "Profile"
        profileImg.roundImage(image: profileImg)
        profileImg.image = UIImage(data: data!)
       // profileImg.image = UIImage(systemName: "person.fill")
      //  profileBackView.backgroundColor = UtilityView.color
        print(userName)
        userNameLbl.text = userVM[0].name
        
        
      
    }
    
    //MARK:- Handlers
    
    

 

}
