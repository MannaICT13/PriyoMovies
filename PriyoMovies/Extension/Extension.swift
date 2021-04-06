//
//  Extension.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 6/4/21.
//

import Foundation
import UIKit

extension UIImage{
    var roundedImage : UIImage {
        
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: self.size)
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, 1)
        UIBezierPath(
        roundedRect: rect, cornerRadius: 50
            
        ).addClip()
        self.draw(in: rect)
        
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    
}
