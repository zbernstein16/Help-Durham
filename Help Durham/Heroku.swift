//
//  Heroku.swift
//  Help Durham
//
//  Created by Zachary Bernstein on 8/9/17.
//  Copyright © 2017 Zachary Bernstein. All rights reserved.
//

import Foundation


struct Heroku {
    static let shared = Heroku()
    let baseUrlString = "https://helpdurham.herokuapp.com"
    
    
    
    func eventQueryWithDate(_ date:Date) -> URL {
        let calendar = Calendar(identifier: .gregorian)
        let day = String(calendar.component(.day, from: date))
        let month = String(calendar.component(.month, from: date))
        let year = String(calendar.component(.year, from: date))
        
        let dateString = [year,month,day].joined(separator: "-")
        
        
        
        return URL(string:baseUrlString+"/events?date="+dateString)!
    }
    
    
    
}
