//
//  SplashViewController.swift
//  Assignment
//
//  Created by Uday Mishra on 12/04/19.
//  Copyright © 2019 Uday Mishra. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    let logoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor().colorFromHexString("1787E8")
        view.addSubview(logoImageView)
        
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 128).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 240).isActive = true
        
        //todo add splash screen logic.
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        gotoLoginViewController()
    }
    
    func gotoLoginViewController() {
        let loginViewController = LoginViewController()
        present(loginViewController,animated:true,completion:nil)
    }

}
