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
        
        let fileUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("PriyoMoviess.sqlite")
        
        guard let url = fileUrl else {return}
        
        if sqlite3_open(url.path, &db) == SQLITE_OK{
            print("File url : \(String(describing: url.path))")
        }else{
            return
        }
        
    }
    
    
    func createTable()  {
        
        var tableCreateStat : OpaquePointer?
        
        let tableCreateQuery = "CREATE TABLE IF NOT EXISTS PriyoMoviess(name VARCHAR(100),userName VARCHAR(100) PRIMARY KEY,password VARCHAR(100) NOT NULL,img TEXT);"
        
        if sqlite3_prepare_v2(db, tableCreateQuery, -1, &tableCreateStat, nil) == SQLITE_OK{
            
            guard sqlite3_step(tableCreateStat) == SQLITE_DONE else {
                return
            }
        }else{return}
        
        sqlite3_finalize(tableCreateStat)
    }
    
    
    func registerUser(name : String,userName: String,password : String ,img:String)->Bool{
        var registerStat : OpaquePointer?
        let registerQuery = "INSERT INTO PriyoMoviess(name,userName,password,img) VALUES(?,?,?,?);"
        
        if sqlite3_prepare_v2(db, registerQuery, -1, &registerStat, nil) == SQLITE_OK{
            
            sqlite3_bind_text(registerStat, 1, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(registerStat, 2, (userName as NSString).utf8String, -1, nil)
            sqlite3_bind_text(registerStat, 3, (password as NSString).utf8String, -1, nil)
            sqlite3_bind_text(registerStat, 4, (img as NSString).utf8String, -1, nil)
            if sqlite3_step(registerStat) == SQLITE_DONE{
                return true
            }else{
                return false
            }
            
        }else{
            return false
            
        }
        
    }
    
    func userLogin(userName:String,password:String,complition:([UserLoginModel]?)->())-> Bool {
        
        var loginStat :OpaquePointer?
        
        
        let userName = userName as NSString
        let password = password as NSString
        var isFail = Bool()
        
        let loginQuery = "SELECT * FROM PriyoMoviess WHERE userName = '\(userName)' AND password = '\(password)';"
        
        var userLoginData = [UserLoginModel]()
        if sqlite3_prepare_v2(db, loginQuery, -1, &loginStat, nil) == SQLITE_OK{
            
            if sqlite3_step(loginStat) == SQLITE_ROW{
                
                let userNameString = sqlite3_column_text(loginStat, 1)
                let passwordString = sqlite3_column_text(loginStat, 2)
                let userName = String(cString: userNameString!)
                let password = String(cString: passwordString!)
                
            userLoginData.append(UserLoginModel(userName: userName, password: password))
               
                isFail = true
            }else{
              isFail = false
            }
        }else{
            
            isFail = false
        }
        
        complition(userLoginData)
        return isFail
       
        
    }
    
    
    func getUserData(userName : String,completion: @escaping ([UserModel])->()){
        
        
        var userData = [UserModel]()
        var getStat : OpaquePointer?
        let userName = userName as NSString
        let selectQuery = "SELECT * FROM PriyoMoviess WHERE userName = '\(userName)';"
        
        if sqlite3_prepare_v2(db, selectQuery, -1, &getStat, nil) == SQLITE_OK{
        
            if sqlite3_step(getStat) == SQLITE_ROW{
                
                let name = sqlite3_column_text(getStat, 0)
                let userName = sqlite3_column_text(getStat, 1)
                let password = sqlite3_column_text(getStat, 2)
                let img = sqlite3_column_text(getStat, 3)
                
                
                let nameStr = String(cString: name!)
                let userNameStr = String(cString: userName!)
                let passwordStr = String(cString: password!)
                let imgStr = String(cString: img!)
                
                userData.append(UserModel(img: imgStr, name: nameStr, userName: userNameStr, password: passwordStr))
                
                
              
            }else{
                return
                
            }
            
            
            
        }else{
            
            return
        }
        
        completion(userData)
        
        
        
        
        
        
        
    }
    

    
    

}
