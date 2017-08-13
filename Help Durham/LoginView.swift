//
//  LoginView.swift
//  Help Durham
//
//  Created by Zachary Bernstein on 8/12/17.
//  Copyright © 2017 Zachary Bernstein. All rights reserved.
//

import UIKit

let buttonWidth:CGFloat = 100.0
let buttonHeight:CGFloat = 50.0
let textFieldHeight:CGFloat = 50.0
let textFieldWidth:CGFloat = 300.0

protocol LoginViewDelegate: class {
    func login(withEmail email:String,password:String)
}
class LoginView: UIView {
    
    weak var delegate:LoginViewDelegate?
    
    var inputsContainerViewCenterXConstraint:NSLayoutConstraint?

    let inputsContainerView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let loginButton:UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(colorLiteralRed: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    let registerButton:UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(colorLiteralRed: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    let emailTextField:UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor.white
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    

    let passwordTextField:UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor.white
        tf.isSecureTextEntry = true
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let logoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "duke")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = UIColor.mainBlue()
        
        self.addSubview(inputsContainerView)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
        self.addSubview(logoImageView)
        
        setupTextFields()
        setUploginButton()
        setUpRegisterButton()
        setupLogoImageView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: Animate 
    func animate() {
//        inputsContainerViewCenterXConstraint?.isActive = false
//        inputsContainerViewCenterXConstraint = inputsContainerView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
//        inputsContainerViewCenterXConstraint?.isActive = true
//        UIView.animate(withDuration: 3.0, delay: 0, options: [.curveEaseInOut], animations: {
//            self.layoutIfNeeded()
//        }, completion: nil)

    }
    //MARK: UI
    func setupTextFields() {
   
        //Add Email
        self.addSubview(emailTextField)
        
        //Need x,y,width height constraints for email
        emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant:-textFieldHeight-5).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: textFieldWidth).isActive = true
     
    
        //Add Password
        self.addSubview(passwordTextField)
        
        //Constraints for password
        passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant:+textFieldHeight + 5).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: textFieldWidth).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: textFieldHeight).isActive = true
    }
    
    func setUploginButton() {
        
        //need x,y,width, neight constraints
        self.addSubview(loginButton)
        loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: textFieldHeight).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        loginButton.addTarget(self, action: #selector(loginButtonPressed(sender:)), for: .touchDown)
        
        
    }
    
    func setUpRegisterButton() {
        
        //need x,y,width, neight constraints
        self.addSubview(registerButton)
        registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        
    }
    
    func setupLogoImageView()
    {
//        //need x,y,width, neight constraints
//        logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        logoImageView.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
//        logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func loginButtonPressed(sender: AnyObject) {
        self.delegate?.login(withEmail: emailTextField.text!, password: passwordTextField.text!)
    }

}
