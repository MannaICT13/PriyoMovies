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
        tapRecognizer()

    
    }
    
    
    //MARK:- Handlers
    
    @IBAction func registerBtnAction(_ sender: Any) {
        
        guard let name = nameTextField.text else {return}
        guard let userName = userNameTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        guard userImageView.image != nil else {return}
       
        let image = userImageView.image 
        let imageData : NSData = image!.pngData()! as NSData
        let imageStr = imageData.base64EncodedData(options: .lineLength64Characters)
        
        if name == "" || userName == "" || password == "" {
            showAlert(msg:  "Registration Failed!")
        
        }else{
            if   UserService.shareInstance.registerUser(name: name, userName: userName, password: password, img: imageStr.base64EncodedString()) == true{
                showAlert(msg: "Registration Successfull!")
          }else{
            showAlert(msg: "Registration Failed! or already Registered")
            return
          }
            
            
        }
    
        
        
        
        
        
    }
    

}


extension RegistrationViewController {
    
    //MARK:- Handlers
    
    private func utilityViewManager(){
        
        userImageView.image = UIImage(named: "plus.png")
        userImageView.roundImage(image: userImageView)
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

extension RegistrationViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    private func tapRecognizer(){
        
        
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_ : )))
        userImageView.isUserInteractionEnabled  = true
        userImageView.addGestureRecognizer(tabGesture)
        
    }
    @objc func imageTapped(_ sender : UITapGestureRecognizer ){
        
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        userImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
        
        
        
    }
    
    
    
    
}
