//
//  PopularMovieViewController.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 7/4/21.
//

import UIKit

class PopularMovieViewController: UIViewController {

    //MARK:- Properties
    
    var popularMVM = [PopularMovieViewModel]()
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    //MARK:- Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieService.sharedInstance.getPopularMovie { (results) in
        
            self.popularMVM = results.map({return PopularMovieViewModel(result: $0)})
        }

       
    }
    
    //MARK:- Handlers
    
    
    

   
}
//extension PopularMovieViewController : UICollectionViewDelegate,UICollectionViewDataSource{
//
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return results.count
//
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = self.movieCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PopularMovieCollectionViewCell
//        cell.titleLbl.text = "results[indexPath.row].results.title"
//        return cell
//    }
//
    
//}
