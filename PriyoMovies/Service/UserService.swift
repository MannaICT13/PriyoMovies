//
//  UserService.swift
//  PriyoMovies
//
//  Created by Md Khaled Hasan Manna on 7/4/21.
//

import UIKit
import Foundation
import SQLite3


class UserService: NSObject {
    
    
    //MARK:- Properties
    static let shareInstance = UserService()
    var db : OpaquePointer?
    
    //MARK:- Handlers
    
    func openConnection(){
        
        let fileUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("PriyoMovies.sqlite")
        
        guard let url = fileUrl else {return}
        
        if sqlite3_open(url.path, &db) == SQLITE_OK{
            print("File url : \(String(describing: url.path))")
        }else{
            return
        }
        
    }
    
    
    func createTable()  {
        
        var tableCreateStat : OpaquePointer?
        
        let tableCreateQuery = "CREATE TABLE IF NOT EXISTS PriyoMovies(name VARCHAR(100),userName VARCHAR(100) PRIMARY KEY NOT NULL,password VARCHAR(100) NOT NULL,img BLOB);"
        
        if sqlite3_prepare_v2(db, tableCreateQuery, -1, &tableCreateStat, nil) == SQLITE_OK{
            
            guard sqlite3_step(tableCreateStat) == SQLITE_DONE else {
                return
            }
        }else{return}
        
        sqlite3_finalize(tableCreateStat)
    }
    
    

    
    

}
