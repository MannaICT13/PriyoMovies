//
//  Extension.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 6/4/21.
//

import Foundation
import UIKit

extension UIImageView{
    
    func roundImage( image : UIImageView){
        
        image.layer.cornerRadius = image.frame.width/2
        image.layer.borderWidth = 3.0
        image.layer.borderColor = UIColor.red.cgColor
        image.clipsToBounds = true
        
    }
    
    
}
extension UIViewController{
    
    func showAlert(title : String ,msg:String){
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
}
