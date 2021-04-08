//
//  FavouriteViewController.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 8/4/21.
//

import UIKit

class FavouriteViewController: UIViewController {

    @IBOutlet weak var favouriteTableView: UITableView!
    
    var userName = String()
    var favouriteMVM = [FavouriteMovieViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SaveMovieService.sharedInstance.getMovie(userName: userName) { (results) in
            
            self.favouriteMVM = results.map({return FavouriteMovieViewModel(result: $0)})
        }
        
        favouriteTableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        SaveMovieService.sharedInstance.getMovie(userName: userName) { (results) in
            
            self.favouriteMVM = results.map({return FavouriteMovieViewModel(result: $0)})
        }
        favouriteTableView.reloadData()
        
        
    }
    


}


extension FavouriteViewController : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteMVM.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.favouriteTableView.dequeueReusableCell(withIdentifier: "cell") as! FavouriteTableViewCell
      
        let imgStr = favouriteMVM[indexPath.row].img
        let dataDecoded:NSData = NSData(base64Encoded: imgStr, options: NSData.Base64DecodingOptions(rawValue: 0))!
        let data = Data(base64Encoded: dataDecoded as Data,options: .ignoreUnknownCharacters)
        
        
        cell.titleLbl.text = favouriteMVM[indexPath.row].title
        cell.posterImg.image = UIImage(data: data!)
       // cell.backgroundColor = .red
       // cell.textLabel?.text = favouriteMVM[indexPath.row].title
        return cell
    }
    
    
    
}
