//
//  SaveMovieService.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 8/4/21.
//

import UIKit
import SQLite3
class SaveMovieService: NSObject {

    static let sharedInstance = SaveMovieService()
    
    var db : OpaquePointer?
    
    //MARK:- Handlers
    
    func openConnection(userName : String){
        
        let fileUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("\(userName).sqlite")
        
        guard let url = fileUrl else {return}
        
        if sqlite3_open(url.path, &db) == SQLITE_OK{
            print("File url : \(String(describing: url.path))")
        }else{
            return
        }
        
    }
    
    
    func createTable(userName: String)  {
        
        var tableCreateStat : OpaquePointer?
        
        let tableCreateQuery = "CREATE TABLE IF NOT EXISTS '\(userName)'(title VARCHAR(100),img TEXT);"
        
        if sqlite3_prepare_v2(db, tableCreateQuery, -1, &tableCreateStat, nil) == SQLITE_OK{
            
            guard sqlite3_step(tableCreateStat) == SQLITE_DONE else {
                return
            }
        }else{return}
        
        sqlite3_finalize(tableCreateStat)
    }
    
    func saveMovie(userName : String,title : String,img:String)->Bool{
        var registerStat : OpaquePointer?
        let registerQuery = "INSERT INTO '\(userName)'(title,img) VALUES(?,?);"
        
        if sqlite3_prepare_v2(db, registerQuery, -1, &registerStat, nil) == SQLITE_OK{
            
            sqlite3_bind_text(registerStat, 1, (title as NSString).utf8String, -1, nil)
            sqlite3_bind_text(registerStat, 2, (img as NSString).utf8String, -1, nil)
            
            if sqlite3_step(registerStat) == SQLITE_DONE{
                return true
            }else{
                return false
            }
            
        }else{
            return false
            
        }
        
    }
    
    func getMovie(userName : String,completion: @escaping ([FavouriteMovieModel])->()){
        
        
        var userData = [FavouriteMovieModel]()
        var getStat : OpaquePointer?
        let userName = userName as NSString
        
        let selectQuery = "SELECT * FROM '\(userName)';"
        
        if sqlite3_prepare_v2(db, selectQuery, -1, &getStat, nil) == SQLITE_OK{
        
            while sqlite3_step(getStat) == SQLITE_ROW{
                
                let title = sqlite3_column_text(getStat, 0)
                let img = sqlite3_column_text(getStat, 1)
                
                
                let titleStr = String(cString: title!)
                let imgStr = String(cString: img!)
                
                userData.append(FavouriteMovieModel( title: titleStr,img: imgStr))
                
                
              
            }
            
        }else{
            
            return
        }
        
        completion(userData)
        
        
        
        
        
        
        
    }
    
    
    
    
}
