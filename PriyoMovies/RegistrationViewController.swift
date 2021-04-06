//
//  RegistrationViewController.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 6/4/21.
//

import UIKit

class RegistrationViewController: UIViewController {

    
    //MARK:- Properties
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var nameImg: UIImageView!
    @IBOutlet weak var userNameImg: UIImageView!
    @IBOutlet weak var passwordImg: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerBtnOutlet: UIButton!
    
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        utilityViewManager()
        setUpImage()

       
    }
    
    
    //MARK:- Handlers
    
    @IBAction func registerBtnAction(_ sender: Any) {
    }
    

}


extension RegistrationViewController {
    
    //MARK:- Handlers
    
    private func utilityViewManager(){
        
        userImageView.image = UIImage(named: "plus.png")?.roundedImage
        nameImg.image = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.red)
        userNameImg.image = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.red)
        passwordImg.image = UIImage(systemName: "lock.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(.red)
        
    }
    
    private func setUpImage(){
        
        UtilityView.lineTextField(textField: userNameTextField)
        UtilityView.lineTextField(textField: nameTextField)
        UtilityView.lineTextField(textField: passwordTextField)

        UtilityView.roundFillButton(button: registerBtnOutlet)
    
       
    }
    
    
    
    
    
    
}
