//
//  User.swift
//  Help Durham
//
//  Created by Zachary Bernstein on 8/9/17.
//  Copyright © 2017 Zachary Bernstein. All rights reserved.
//

struct User {
    static var shared = User(token:nil)
    var token:String?
    
}

