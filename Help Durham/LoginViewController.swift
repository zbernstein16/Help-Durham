//
//  LoginViewController.swift
//  Help Durham
//
//  Created by Zachary Bernstein on 8/9/17.
//  Copyright © 2017 Zachary Bernstein. All rights reserved.
//


//TODO:
//-Setup delegation and protocol

import UIKit

class LoginViewController:UIViewController, LoginViewDelegate {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let loginView = LoginView()
        loginView.delegate = self
        self.view = loginView
        loginView.animate()
        
        

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       
    }
    
    func login(withEmail email: String, password: String) {
        

        Backend.shared.authenticateUser(email: email, password: password, completion: {
            error, success in
            

            if let error = error {
                    let ac = UIAlertController(title: "Failed to login", message: error.localizedDescription, preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                    ac.addAction(action)
                    self.present(ac, animated: true, completion: nil)
                
            } else if success == true {
                let ac = UIAlertController(title: "Logged in successfully", message: "Yay", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                ac.addAction(action)
                print(User.shared.token)
                self.present(ac, animated: true, completion: nil)
            } else {
                let ac = UIAlertController(title: "Failed to login", message: "", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                ac.addAction(action)
                self.present(ac, animated: true, completion: nil)
            }
        })
    }
    
    
}
