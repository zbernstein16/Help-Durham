//
//  ViewController.swift
//  Help Durham
//
//  Created by Zachary Bernstein on 8/9/17.
//  Copyright © 2017 Zachary Bernstein. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    var json:JSON?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        getData()
        
        
        
        
        print(Heroku.shared.eventQueryWithDate(Date()))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        return cell
    }
    
    func getData() {
        let url = URL(string: "https://helpdurham.herokuapp.com/events?date=2017-05-04")!;
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: url, completionHandler: {
            data,response,error in
            
            if let error = error {
                print(error)
                return
            }
            
            if let data = data, let response = response {
                print("Found data and response");
                print(response);
                
                
                do {
                    try self.json = JSON(data: data)
                } catch {
                    print("Failed to get json")
                    return
                }
                
                print(self.json)
            }
            
            
        })
        
        task.resume()
    }

}

