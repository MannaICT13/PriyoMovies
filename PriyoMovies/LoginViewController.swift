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
    
    
    
    var userLoginVM = [UserLoginViewModel]()
    
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
    utilityViewManager()
        setUpIcon()
        
 
    }
    
    //MARK:- Handlers

    @IBAction func logingBtnAction(_ sender: Any) {
        
        guard let userName = userNameTextField.text else{return }
        guard let password = passwordTextField.text else {return }
        
        if  UserService.shareInstance.userLogin(userName: userName, password: password, complition: { (login) in
            
        self.userLoginVM = login?.map({return UserLoginViewModel(userLogin: $0)}) ?? []
            
        }) == true{
            if (userName == userLoginVM[0].userName &&  password == userLoginVM[0].password ){
                print("Success")
                let tabVC = self.storyboard?.instantiateViewController(identifier: "TabBarController") as! TabBarController
            
                tabVC.userName = userName
                self.navigationController?.pushViewController(tabVC, animated: true)
        }
      
      
        }else{
            showAlert(title: "Error Message", msg: "Wrong UserName or password!")
        }
        
    }
    
    @IBAction func registrationBtnAction(_ sender: Any) {
        
        let registerVC = self.storyboard?.instantiateViewController(identifier: "RegistrationViewController") as! RegistrationViewController
        self.navigationController?.pushViewController(registerVC, animated: true)
        
        
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
