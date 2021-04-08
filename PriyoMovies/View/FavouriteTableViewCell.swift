//
//  FavouriteTableViewCell.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 8/4/21.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    
    @IBOutlet weak var posterImg: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    
    var titleStr = String()
    var img = UIImage()

    override func awakeFromNib() {
        super.awakeFromNib()
       titleLbl.text = titleStr
        posterImg.image = img
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
