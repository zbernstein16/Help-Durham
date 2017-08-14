//
//  EventViewController.swift
//  Help Durham
//
//  Created by Zachary Bernstein on 8/13/17.
//  Copyright © 2017 Zachary Bernstein. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    
    //https://github.com/patchthecode/JTAppleCalendar

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.white
        
        
        let eventView = EventView(frame: self.view.frame)
        eventView.tableView.delegate = self
        eventView.tableView.dataSource = self
        self.view = eventView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension EventViewController:UITableViewDelegate {
    
}
extension EventViewController:UITableViewDataSource {
    
}
