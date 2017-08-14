//
//  EventView.swift
//  Help Durham
//
//  Created by Zachary Bernstein on 8/13/17.
//  Copyright © 2017 Zachary Bernstein. All rights reserved.
//

import UIKit

class EventView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let tableView:UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = UIColor.red
        return tv
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        setupViews()
    }
    
    required init?(coder:NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews() {
        
        self.addSubview(tableView)
        tableView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.2*self.frame.height).isActive = true
        tableView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

}
