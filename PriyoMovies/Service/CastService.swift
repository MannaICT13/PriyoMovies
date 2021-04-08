//
//  CastService.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 8/4/21.
//

import UIKit

class CastService: NSObject {

    
    static let sharedInstance = CastService()
    
    func loadCastData(movie_id:Int,completion: @escaping ([CastModel])->()){
        
        let apiKey = "3fa9058382669f72dcb18fb405b7a831"
        let urlSring = "https://api.themoviedb.org/3/movie/\(movie_id)/credits?api_key=\(apiKey)"
        
        
        guard let url = URL(string: urlSring) else {
            return
        }
        var castData = [CastModel]()
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let err = error{
                print(err.localizedDescription)
            }else{
                guard let data = data else {
                    return
                }
                
                
                
                do{
                    
                    
                    let result  = try JSONDecoder().decode(CastResultModel.self, from: data)
                   
                    for results in result.cast{
                        castData.append(CastModel(name: results.name, img: results.img))
                    }
                    
                }catch let jsonErr as NSError{
                    print(jsonErr.localizedDescription)
                }
                
                
                
            }
            
            
            
        }.resume()
        
        
        
        completion(castData)
        
        
        
    }
    
    
    
    
    
}
