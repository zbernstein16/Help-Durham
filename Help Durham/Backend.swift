//
//  Backend.swift
//  Help Durham
//
//  Created by Zachary Bernstein on 8/12/17.
//  Copyright © 2017 Zachary Bernstein. All rights reserved.
//
import Foundation
let baseUrlString = "https://helpdurham.herokuapp.com/"

// events?date=2017-5-7

enum HerokuError:Error {
    
    
    case sessionFailed
    case notAuthorized
    case wrongFormat
    case wrongEmailOrPassword
    
    public var localizedDescription:String {
        switch self {
        case .sessionFailed:
            return "Session Failed"
        case .notAuthorized:
            return "Not Authorized"
        case .wrongFormat:
            return "Improperly Formatted"
        case . wrongEmailOrPassword:
            return "Wrong Email or Password"
        default:
            return "Failed"
        }
    }
}
struct Backend {
    static let shared = Backend()
    
    
    func authenticateUser(email:String,password:String,completion:@escaping (HerokuError?,Bool) -> Void) {
        
        let authenticateUrl = URL(string: baseUrlString + "authenticate")!
        var request = URLRequest(url: authenticateUrl)
        let bodyJson = "email="+email+"&password="+password
        request.httpMethod = "POST"
        
        //Get Data to post
        let postData = bodyJson.data(using: .ascii, allowLossyConversion: true)!
        request.httpBody = postData

        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            data,res,error in
            
            if let error = error {
                performOnMainQueue(completion, a: HerokuError.sessionFailed, b: false)
                return
            } else if let data = data {
                var json:JSON
                do {
                    try json = JSON(data:data)
                    
                    if json["success"] == true {
                        User.shared.token = json["token"].stringValue
                        performOnMainQueue(completion, a: nil, b: true)
                        return
                    } else {
                        performOnMainQueue(completion, a: HerokuError.wrongEmailOrPassword, b: false)
                    }
                } catch {
                    performOnMainQueue(completion, a: HerokuError.sessionFailed, b: false)
                    return
                }
                
            }
        })
        
        task.resume()
    }
    func getEventsWithDate(_ date:Date,completion:@escaping (HerokuError?,JSON?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            
            
            let year,month,day:String
            (year,month,day) = date.getComponents()
            let queryUrl = URL(string: baseUrlString + "events?date="+[year,month,day].joined(separator: "-"))!
            var request = URLRequest(url: queryUrl)
            request.allHTTPHeaderFields = ["Authorization":"JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJfaWQiOiI1OThhNDljN2E0YTc2YzhhZmQwMGZmZDQiLCJlbWFpbCI6InpiMzJAZHVrZS5lZHUiLCJwYXNzd29yZCI6IiQyYSQxMCR2cUxCZFJrdDFIRzBMUVUyelFrT0F1ei9CMnFaS003VWRYcEJNa1JYQ2p0T29CVldDSHNTcSIsIl9fdiI6MH0.E5rW_RnCGQiGqu4UQxq4Wrj3MI6PkTpE3Mops22bZyE"]
            let session = URLSession.shared;
            
            let task = session.dataTask(with: request, completionHandler: {
                data,response,error in
                
                if let error = error {
                    performOnMainQueue(completion, a: HerokuError.sessionFailed, b: nil)
                    return
                } else if let data = data {
                    var json:JSON
                    do {
                        try json = JSON(data:data)
                        if json["success"] == false {
                            performOnMainQueue(completion,a:HerokuError.notAuthorized, b:nil)
                            return
                        } else {
                            performOnMainQueue(completion, a: nil, b: json)
                            return
                        }
                    } catch {
                        performOnMainQueue(completion, a: HerokuError.sessionFailed, b: nil)
                        return
                    }
                
                    
                } else {
                    performOnMainQueue(completion, a: HerokuError.sessionFailed, b: nil)
                    return
                }
            })
            
            
            task.resume()
        }
    }
    
 
    
}

 func performOnMainQueue<A,B>(_ block:(A,B)->(Void),a:A,b:B) {
    DispatchQueue.main.sync {
        block(a,b)
    }
}
