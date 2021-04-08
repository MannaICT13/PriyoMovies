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
    
    @IBOutlet weak var castCollectionView: UICollectionView!
    
    var titleStr = String()
    var ratingStr = String()
    var dateStr = String()
    var summaryStr  = String()
    var coverImage = UIImage()
    var posterImage = UIImage()
    
    var userName = String()
    
    var movie_id = String()
    
    var castVM = [CastViewModel]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        addFavourite()
        titleLbl.text = titleStr
        ratingLbl.text = ratingStr
        dateLbl.text = dateStr
        summaryLbl.text = summaryStr
        coverPhotoImg.image = posterImage
        posterImg.image = posterImage
        
        print(movie_id)
        CastService.sharedInstance.loadCastData(movie_id: movie_id) { (cast) in
            self.castVM = cast.map({return CastViewModel(result: $0)})
            
        }
      
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
extension MovieDetailViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return castVM.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.castCollectionView.dequeueReusableCell(withReuseIdentifier: "castCell", for: indexPath) as! CastCollectionViewCell
   
        cell.layer.cornerRadius = 3
        cell.layer.masksToBounds = true
        cell.castName.text = castVM[indexPath.row].name
        let poster = castVM[indexPath.row].img
        
        if let img = getImage(from: poster){
            cell.castImg.image = img
        }
        return cell
    }
    
    
    
    
    
}

extension MovieDetailViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = castCollectionView.frame.width
       
        return CGSize(width: collectionViewWidth/4-1, height: collectionViewWidth/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}
extension MovieDetailViewController{
    
    func getImage(from string: String) -> UIImage? {
        let  urlString = "https://image.tmdb.org/t/p/w300" + string
        
        guard let url = URL(string: urlString)
            else {
                print("Unable to create URL")
                return nil
        }

        var image: UIImage? = nil
        do {
          
            let data = try Data(contentsOf: url, options: [])

           
            image = UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
        }

        return image
    }
    
    
}
