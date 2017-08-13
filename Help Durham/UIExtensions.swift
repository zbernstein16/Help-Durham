//
//  UIExtensions.swift
//  Help Durham
//
//  Created by Zachary Bernstein on 8/9/17.
//  Copyright © 2017 Zachary Bernstein. All rights reserved.
//

import UIKit


extension UIColor
{
    class func mainBlue() -> UIColor {
        return UIColor(colorLiteralRed: 16.0/250, green: 78.0/250.0, blue: 156.0/250.0, alpha: 1.0)
    }
    class func mainRed() -> UIColor {
        return UIColor(colorLiteralRed: 189.0/250, green: 49.0/250.0, blue: 45.0/250.0, alpha: 1.0)
    }
}


extension Date
{
    func getComponents() -> (String,String,String)
    {
        let calendar = Calendar(identifier: .gregorian)
        let getComponent = {
            (component:Calendar.Component) in
            return String(calendar.component(component, from: self));
        }
        
        return (getComponent(.year),getComponent(.month),getComponent(.day))
        
        
    }
}
