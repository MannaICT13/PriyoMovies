//
//  LoginViewController.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 6/4/21.
//

import UIKit

class LoginViewController: UIViewController {

    
    //MARK:- Properties
    @IBOutlet weak var iconImg: UIImageView!
    
    @IBOutlet weak var userNameImg: UIImageView!
    @IBOutlet weak var passwordImg: UIImageView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginBtnOutlet: UIButton!
    @IBOutlet weak var registrationBtnOutlet: UIButton!
    
    
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
    utilityViewManager()
        setUpIcon()

      
    }
    
    //MARK:- Handlers

    @IBAction func logingBtnAction(_ sender: Any) {
    }
    
    @IBAction func registrationBtnAction(_ sender: Any) {
    }
    
    

}


extension LoginViewController{
    
    
    //MARK:- Handlers
    private func utilityViewManager(){
        
        UtilityView.lineTextField(textField: userNameTextField)
        UtilityView.lineTextField(textField: passwordTextField)
        UtilityView.roundFillButton(button: loginBtnOutlet)
        UtilityView.roundButtion(button: registrationBtnOutlet)
        
        
    }
    private func setUpIcon(){
        
        iconImg.image = UIImage(named: "icon.png")
        userNameImg.image  = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.red)
        passwordImg.image  = UIImage(systemName: "lock.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.red)
        
    }
    
    
    
}
