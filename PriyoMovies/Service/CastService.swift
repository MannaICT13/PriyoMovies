//
//  CastService.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 8/4/21.
//

import UIKit

class CastService: NSObject {

    
    static let sharedInstance = CastService()
     
//        let apiKey = "3fa9058382669f72dcb18fb405b7a831"
//        let urlSring = "https://api.themoviedb.org/3/movie/\(movie_id)/credits?api_key=\(apiKey)"
        
    func loadCastData(movie_id : String,completion: @escaping ([CastModel])->()){
        
        var resultData = [CastModel]()
        
        let apiKey = "3fa9058382669f72dcb18fb405b7a831"
        let urlSring = "https://api.themoviedb.org/3/movie/\(movie_id)/credits?api_key=\(apiKey)"
        
        guard let url = URL(string: urlSring) else {return}
    
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
            
            if let  error = error{
                print(error.localizedDescription)
                return
            }else{
                
                
                guard let data = data else {
                   
                    return
                }
                
                do{
                    
                    let results = try JSONDecoder().decode(CastResultModel.self, from: data)
                   
                    for result in results.cast{
        
                        resultData.append(CastModel(name: result.name, img: result.img))
                    }
                    completion(resultData)
                    
                }catch let jsonError as NSError{
                    print(jsonError.localizedDescription)
                    return
                }
                
                
                
                
            }
            
        }
        task.resume()
        
       
    }

    
    
    
}
