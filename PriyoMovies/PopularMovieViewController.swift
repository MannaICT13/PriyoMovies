//
//  PopularMovieViewController.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 7/4/21.
//

import UIKit

class PopularMovieViewController: UIViewController {

    //MARK:- Properties
    var userName = String()
    var popularMVM = [PopularMovieViewModel]()
    var posterImg = UIImageView()
    @IBOutlet weak var movieCollectionView: UICollectionView!
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieService.sharedInstance.getPopularMovie { (results) in
        
            self.popularMVM = results.map({return PopularMovieViewModel(result: $0)}) 
        }

        movieCollectionView.reloadData()
       
    }
    
    //MARK:- Handlers
    
    
   

   
}
extension PopularMovieViewController : UICollectionViewDelegate,UICollectionViewDataSource{


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return popularMVM.count

    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell: PopularMovieCollectionViewCell = self.movieCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PopularMovieCollectionViewCell
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.titleLbl.text = popularMVM[indexPath.row].title
        cell.ratingLbl.text = "\(popularMVM[indexPath.row].rating)"
         
        
        
        let poster = popularMVM[indexPath.row].poster
        if let image = getImage(from: poster) {
            cell.posterImg.image = image
        }
        
      
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let DetailVC = self.storyboard?.instantiateViewController(identifier: "MovieDetailViewController") as! MovieDetailViewController
        
        DetailVC.userName = userName
        DetailVC.titleStr = popularMVM[indexPath.row].title
        DetailVC.ratingStr = "\(popularMVM[indexPath.row].rating)"
        DetailVC.dateStr = popularMVM[indexPath.row].releaseDate
        DetailVC.summaryStr = popularMVM[indexPath.row].summary
        
        let cover = popularMVM[indexPath.row].coverPhoto
        
        if let coverImg = getImage(from: cover){
            DetailVC.coverImage = coverImg
        }
        
        let poster = popularMVM[indexPath.row].poster
        if let posterImg = getImage(from: poster){
            DetailVC.posterImage = posterImg
        }
        
        
    
        self.navigationController?.pushViewController(DetailVC, animated: true)
        
        
        
    }

    
}

extension PopularMovieViewController : UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = movieCollectionView.frame.width
        let collectionViewHeight = movieCollectionView.frame.height
        return CGSize(width: collectionViewWidth/2-3, height: collectionViewHeight/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
}
extension PopularMovieViewController{
    
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
