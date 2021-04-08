//
//  UtilityView.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 6/4/21.
//

import Foundation
import UIKit

class UtilityView {
    
    //MARK:- Properties
    
    static let color : UIColor = UIColor(red: 28/255, green: 135/255, blue: 183/255, alpha: 1.0)
    static let cgColor : CGColor = CGColor(red: 28/255, green: 135/255, blue: 183/255, alpha: 1.0)
    
    
    
    //MARK:- Handlers
    
    static func roundFillButton(button : UIButton){
        
        button.backgroundColor = .red
        button.clipsToBounds = true
        button.layer.cornerRadius = 20.0
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.black.cgColor
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        
    }
    static func roundButtion(button : UIButton){
        
        button.backgroundColor = .clear
        button.clipsToBounds = true
        button.layer.cornerRadius = 20.0
        button.layer.borderWidth = 5.0
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.borderColor = UIColor.red.cgColor
        button.tintColor = UIColor.red
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25.0)
        
        
        
    }
    static func lineTextField(textField : UITextField){
        
        let buttomLine = CALayer()
        buttomLine.frame = CGRect(x: 0, y: textField.frame.height-3, width:textField.frame.width-30, height:3.0)
        
        buttomLine.backgroundColor = UIColor.red.cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(buttomLine)
    }
    
    
    
    
}


