//
//  ViewController.swift
//  Assignment
//
//  Created by Uday Mishra on 11/04/19.
//  Copyright © 2019 Uday Mishra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let title_Label: UILabel = {
        let lb = UILabel()
        lb.text = "  Title Label"
        lb.textColor = .black
//        lb.font = Theme.subHeaderOneFont
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("X", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return button
    }()
    
    let bottomSeprator: UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor().colorFromHexString("#616161")
        return view
    }()
    
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let pickupDateLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Pickup Date"
        lb.textColor = UIColor().colorFromHexString("#616161")
        //        lb.font = Theme.subHeaderOneFont
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let pickupDateValueLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Mar 14,2019"
        lb.textColor = .black
        //        lb.font = Theme.subHeaderOneFont
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let locationCodeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Location Code"
        lb.textColor = UIColor().colorFromHexString("#616161")
        //        lb.font = Theme.subHeaderOneFont
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let locationCodeValueLabel: UILabel = {
        let lb = UILabel()
        lb.text = "BND"
        lb.textColor = .black
        //        lb.font = Theme.subHeaderOneFont
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let pickupTimeLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Pickup Time"
        lb.textColor = UIColor().colorFromHexString("#616161")
        //        lb.font = Theme.subHeaderOneFont
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let pickupTimeValueLabel: UILabel = {
        let lb = UILabel()
        lb.text = "07:12 A.M."
        lb.textColor = .black
        //        lb.font = Theme.subHeaderOneFont
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let dockIDLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Dock ID"
        lb.textColor = UIColor().colorFromHexString("#616161")
        //        lb.font = Theme.subHeaderOneFont
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let dockIDValueLabel: UILabel = {
        let lb = UILabel()
        lb.text = "ABC"
        lb.textColor = .black
        //        lb.font = Theme.subHeaderOneFont
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let secondBottomSeprator: UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor().colorFromHexString("#616161")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let horizontalSeprator: UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor().colorFromHexString("#616161")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let locationNameLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Dock ID"
        lb.textColor = UIColor().colorFromHexString("#616161")
        //        lb.font = Theme.subHeaderOneFont
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let addressLabel: UILabel = {
        let lb = UILabel()
        
        lb.textColor = .black
        lb.numberOfLines = 0
        //        lb.font = Theme.subHeaderOneFont
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text =  """
        Line One
        Line Two
        Line Three
        """
        return lb
    }()
    
    let thirdBottomSeprator: UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor().colorFromHexString("#616161")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let checklistIcon:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "pod")
        iv.isUserInteractionEnabled = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let checklistLabel: UILabel = {
        let lb = UILabel()
        lb.text = "CheckList"
        lb.textColor = UIColor().colorFromHexString("#616161")
        //        lb.font = Theme.subHeaderOneFont
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let documentIcon:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "document")
        iv.isUserInteractionEnabled = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let documentLabel: UILabel = {
        let lb = UILabel()
        lb.text = "CheckList"
        lb.textColor = UIColor().colorFromHexString("#616161")
        //        lb.font = Theme.subHeaderOneFont
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let productIcon:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "product")
        iv.isUserInteractionEnabled = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let productLabel: UILabel = {
        let lb = UILabel()
        lb.text = "CheckList"
        lb.textColor = UIColor().colorFromHexString("#616161")
        //        lb.font = Theme.subHeaderOneFont
        lb.textAlignment = .left
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    
    let finishButton:UIButton = {
        let button = UIButton(type:.system)
        //        button.backgroundColor = UIColor(r:80,g:101,b:161)
        button.setTitle("Finish Pickup", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button .setTitleColor(UIColor().colorFromHexString("#616161"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addBorder()
        return button
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    @objc func closeAction() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         view.backgroundColor = .white
        
        view.addSubview(headerView)
        view.addSubview(containerView)
        headerView.addSubview(title_Label)
        headerView.addSubview(clearButton)
        headerView.addSubview(bottomSeprator)
        
        self.view.addConstraintsWithFormat(format: "H:|[v0]|", views: headerView)
        self.view.addConstraintsWithFormat(format: "H:|[v0]|", views: containerView)
        self.view.addConstraintsWithFormat(format: "V:|[v0(49)][v1]|", views: headerView,containerView)
        
        headerView.addConstraintsWithFormat(format: "H:|[v0]|", views: title_Label)
        headerView.addConstraintsWithFormat(format: "H:[v0(39)]-12-|", views: clearButton)
        headerView.addConstraintsWithFormat(format: "V:|[v0]|", views: title_Label)
        headerView.addConstraintsWithFormat(format: "V:|[v0]|", views: clearButton)
        headerView.addConstraintsWithFormat(format: "H:|[v0]|", views: bottomSeprator)
        headerView.addConstraintsWithFormat(format: "V:[v0(1)]|", views: bottomSeprator)
        
        setUpContainerView()
    }

    override func viewDidAppear(_ animated: Bool) {
        checklistIcon.makeRounded()
        checklistIcon.addBorder();
        
        documentIcon.makeRounded()
        documentIcon.addBorder();
        
        productIcon.makeRounded()
        productIcon.addBorder();
    }
    
    func setUpContainerView() {
        containerView.addSubview(pickupDateLabel)
        containerView.addSubview(pickupDateValueLabel)
        
        containerView.addSubview(locationCodeLabel)
        containerView.addSubview(locationCodeValueLabel)

        containerView.addSubview(pickupTimeLabel)
        containerView.addSubview(pickupTimeValueLabel)

        containerView.addSubview(dockIDLabel)
        containerView.addSubview(dockIDValueLabel)
        
        containerView.addSubview(secondBottomSeprator)
        containerView.addSubview(horizontalSeprator)
        
        containerView.addSubview(locationNameLabel)
        containerView.addSubview(addressLabel)
        
        containerView.addSubview(thirdBottomSeprator)
        
        containerView.addSubview(checklistIcon)
        containerView.addSubview(documentIcon)
        containerView.addSubview(productIcon)
        
        containerView.addSubview(checklistLabel)
        containerView.addSubview(documentLabel)
        containerView.addSubview(productLabel)
        
        containerView.addSubview(finishButton)
        
        pickupDateLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 8).isActive = true
        pickupDateLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 8).isActive = true
        pickupDateLabel.trailingAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pickupDateLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        pickupDateValueLabel.topAnchor.constraint(equalTo: pickupDateLabel.bottomAnchor).isActive = true
        pickupDateValueLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 8).isActive = true
        pickupDateValueLabel.trailingAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pickupDateValueLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        locationCodeLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 8).isActive = true
        locationCodeLabel.leadingAnchor.constraint(equalTo: self.view.centerXAnchor,constant: 8).isActive = true
        locationCodeLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: 4).isActive = true
        locationCodeLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        locationCodeValueLabel.topAnchor.constraint(equalTo: locationCodeLabel.bottomAnchor).isActive = true
        locationCodeValueLabel.leadingAnchor.constraint(equalTo: self.view.centerXAnchor,constant: 8).isActive = true
        locationCodeValueLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: 4).isActive = true
        locationCodeValueLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        pickupTimeLabel.topAnchor.constraint(equalTo: pickupDateValueLabel.bottomAnchor,constant: 16).isActive = true
        pickupTimeLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 8).isActive = true
        pickupTimeLabel.trailingAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pickupTimeLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true

        pickupTimeValueLabel.topAnchor.constraint(equalTo: pickupTimeLabel.bottomAnchor).isActive = true
        pickupTimeValueLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 8).isActive = true
        pickupTimeValueLabel.trailingAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pickupTimeValueLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        dockIDLabel.topAnchor.constraint(equalTo: locationCodeValueLabel.bottomAnchor,constant: 16).isActive = true
        dockIDLabel.leadingAnchor.constraint(equalTo: self.view.centerXAnchor,constant: 8).isActive = true
        dockIDLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: 4).isActive = true
        dockIDLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        dockIDValueLabel.topAnchor.constraint(equalTo: dockIDLabel.bottomAnchor).isActive = true
        dockIDValueLabel.leadingAnchor.constraint(equalTo: self.view.centerXAnchor,constant: 8).isActive = true
        dockIDValueLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: 4).isActive = true
        dockIDValueLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        secondBottomSeprator.bottomAnchor.constraint(equalTo: dockIDValueLabel.bottomAnchor, constant: 4).isActive = true
        secondBottomSeprator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        secondBottomSeprator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        secondBottomSeprator.trailingAnchor.constraint(equalTo:containerView.trailingAnchor).isActive = true
        
        horizontalSeprator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        horizontalSeprator.widthAnchor.constraint(equalToConstant: 1).isActive = true
        horizontalSeprator.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 4).isActive = true
        horizontalSeprator.bottomAnchor.constraint(equalTo:secondBottomSeprator.topAnchor,constant: -4).isActive = true
        
        
        
        locationNameLabel.topAnchor.constraint(equalTo: secondBottomSeprator.bottomAnchor,constant: 4).isActive = true
        locationNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 8).isActive = true
        locationNameLabel.trailingAnchor.constraint(equalTo:containerView.trailingAnchor,constant: 8).isActive = true
        locationNameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        addressLabel.topAnchor.constraint(equalTo: locationNameLabel.bottomAnchor,constant: 4).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 8).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo:containerView.trailingAnchor,constant: 8).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        thirdBottomSeprator.bottomAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 4).isActive = true
        thirdBottomSeprator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        thirdBottomSeprator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        thirdBottomSeprator.trailingAnchor.constraint(equalTo:containerView.trailingAnchor).isActive = true
        
        checklistIcon.topAnchor.constraint(equalTo: thirdBottomSeprator.bottomAnchor,constant: 16).isActive = true
        checklistIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 60).isActive = true
        checklistIcon.widthAnchor.constraint(equalToConstant: 48).isActive = true
        checklistIcon.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        documentIcon.topAnchor.constraint(equalTo: thirdBottomSeprator.bottomAnchor,constant: 16).isActive = true
        documentIcon.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        documentIcon.widthAnchor.constraint(equalToConstant: 48).isActive = true
        documentIcon.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        productIcon.topAnchor.constraint(equalTo: thirdBottomSeprator.bottomAnchor,constant: 16).isActive = true
        productIcon.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -60).isActive = true
        productIcon.widthAnchor.constraint(equalToConstant: 48).isActive = true
        productIcon.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        checklistLabel.topAnchor.constraint(equalTo: checklistIcon.bottomAnchor,constant: 4).isActive = true
        checklistLabel.centerXAnchor.constraint(equalTo: checklistIcon.centerXAnchor).isActive = true
        checklistLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        checklistLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        documentLabel.topAnchor.constraint(equalTo: documentIcon.bottomAnchor,constant: 4).isActive = true
        documentLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        documentLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        documentLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        productLabel.topAnchor.constraint(equalTo: productIcon.bottomAnchor,constant: 4).isActive = true
        productLabel.centerXAnchor.constraint(equalTo: productIcon.centerXAnchor).isActive = true
        productLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        productLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        finishButton.topAnchor.constraint(equalTo: productLabel.bottomAnchor,constant: 4).isActive = true
        finishButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 16).isActive = true
        finishButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -16).isActive = true
        finishButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
    }

}

