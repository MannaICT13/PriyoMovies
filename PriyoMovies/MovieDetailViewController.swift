//
//  MovieDetailViewController.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 8/4/21.
//

import UIKit

class MovieDetailViewController: UIViewController {

    
    
    @IBOutlet weak var coverPhotoImg: UIImageView!
    @IBOutlet weak var posterImg: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var summaryLbl: UILabel!
    
    var titleStr = String()
    var ratingStr = String()
    var dateStr = String()
    var summaryStr  = String()
    var coverImage = UIImage()
    var posterImage = UIImage()
    
    var userName = String()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        addFavourite()
        titleLbl.text = titleStr
        ratingLbl.text = ratingStr
        dateLbl.text = dateStr
        summaryLbl.text = summaryStr
        coverPhotoImg.image = posterImage
        posterImg.image = posterImage

      
    }
    
    
    func addFavourite(){
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(addToFavourite(_:)))
        
        
    }
    
    @objc func addToFavourite(_ sender: UIBarButtonItem){
        
        navigationItem.rightBarButtonItem?.tintColor = .red
        
        let image = posterImg.image
        let imageData : NSData = image!.pngData()! as NSData
        let imageStr = imageData.base64EncodedData(options: .lineLength64Characters)
        
        if  SaveMovieService.sharedInstance.saveMovie(userName: userName, title: titleStr, img:imageStr.base64EncodedString() )==true{
            print("inserted")
        }else{
            print("not inserted")
            return
        }
        
        
    }
    

  
}
