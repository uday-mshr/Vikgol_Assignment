//
//  LoginViewController.swift
//  Assignment
//
//  Created by Uday Mishra on 12/04/19.
//  Copyright © 2019 Uday Mishra. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor().colorFromHexString("266569")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let userNameTextField:UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "  user name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .default
        tf.layer.cornerRadius = 4
        tf.clipsToBounds = true
        return tf
    }()
    
    let passwordTextField:UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.placeholder = "  password"
        tf.isSecureTextEntry = true
        tf.layer.cornerRadius = 4
        tf.clipsToBounds = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .default
        
        return tf
    }()
    
    let loginButton:UIButton = {
        let button = UIButton(type:.system)
        //        button.backgroundColor = UIColor(r:80,g:101,b:161)
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button .setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    let signupButton:UIButton = {
        let button = UIButton(type:.system)
        //        button.backgroundColor = UIColor(r:80,g:101,b:161)
        button.setTitle("Sign up With Email", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button .setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor().colorFromHexString("40CAC6")
        
        loginButton.addTarget(self, action:#selector(self.loginButtonListner), for: .touchUpInside)
        
        self.view.addSubview(inputsContainerView)
        setUpInputsContainerView()
        
    }
    
    func setUpInputsContainerView(){
        //need x,y,width,height constraints
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        inputsContainerView.addSubview(userNameTextField)
        inputsContainerView.addSubview(passwordTextField)
        inputsContainerView.addSubview(loginButton)
//        inputsContainerView.addSubview(signupButton)
        
        userNameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor,constant:12).isActive = true
        userNameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor,constant: 50).isActive = true
        userNameTextField.rightAnchor.constraint(equalTo:inputsContainerView.rightAnchor ,constant: -12).isActive = true
        userNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor,constant:12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor,constant:12).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo:inputsContainerView.rightAnchor ,constant: -12).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginButton.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor,constant:12).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant:12).isActive = true
        loginButton.rightAnchor.constraint(equalTo:inputsContainerView.rightAnchor ,constant: -12).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
//        signupButton.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor,constant:12).isActive = true
//        signupButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor,constant:-100).isActive = true
//        signupButton.rightAnchor.constraint(equalTo:inputsContainerView.rightAnchor ,constant: -12).isActive = true
//        signupButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    @objc func loginButtonListner() {
//        loginRequest(userLoginName: userNameTextField.text!, password:passwordTextField.text!)
                gotoHomeTabViewController()
    }
    
    func gotoHomeTabViewController() {
        let homeViewController = UINavigationController(rootViewController: HomeViewController()) 
        present(homeViewController,animated:true,completion:nil)
    }
    
    
}
