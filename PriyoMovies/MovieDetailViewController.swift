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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        titleLbl.text = titleStr
        ratingLbl.text = ratingStr
        dateLbl.text = dateStr
        summaryLbl.text = summaryStr
        coverPhotoImg.image = posterImage
        posterImg.image = posterImage

      
    }
    

  
}
