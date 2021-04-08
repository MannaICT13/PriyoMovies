//
//  MovieService.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 7/4/21.
//

import UIKit

class MovieService: NSObject {
    
    
    //MARK:- Properties
    static let sharedInstance = MovieService()
   
    
    //MARK:- Handlers
    
    func getPopularMovie(completion: @escaping ([PopularMovieModel])->()){
        
        var resultData = [PopularMovieModel]()
        
        let apiKey = "3fa9058382669f72dcb18fb405b7a831"
        let urlSring = "http://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&page=1&api_key=\(apiKey)"
        
        guard let url = URL(string: urlSring) else {return}
    
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
            
            if let  error = error{
                print(error.localizedDescription)
            }else{
                
                
                guard let data = data else {
                    return
                }
                
                do{
                    
                    let results = try JSONDecoder().decode(ResultModel.self, from: data)
                   
                    for result in results.results{
        
                        resultData.append(PopularMovieModel(id: result.id, coverPhoto: result.coverPhoto, poster: result.poster, title: result.title, summary: result.summary, rating: result.rating, releaseDate: result.releaseDate))
                    }
                  
                
                }catch let jsonError as NSError{
                    print(jsonError.localizedDescription)
                }
                
                
                
                
            }
            
        }
        task.resume()
        
        completion(resultData)
    }

    
    
    
    
    

}
