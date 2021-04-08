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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
    }
    


}


extension FavouriteViewController : UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
}
