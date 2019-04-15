//
//  HomeViewController.swift
//  Assignment
//
//  Created by Uday Mishra on 12/04/19.
//  Copyright © 2019 Uday Mishra. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialBottomSheet

class HomeViewController: UIViewController {
    
    let TopCellId = "TopCellId"
    let CenterCellId = "CenterCellId"
    let BottomCellId = "BottomCellId"
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //layout.itemSize = CGSizeMake(<width>, <height>)
        // Setting the space between cells
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionHeadersPinToVisibleBounds = true
        
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor().colorFromHexString("E0E0E0")
        cv.showsHorizontalScrollIndicator = false
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.allowsMultipleSelection = false
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    
    let AllocateButton:UIButton = {
        let button = UIButton(type:.system)
        button.backgroundColor = UIColor.white
        button.setTitle("Allocate Drivers & Trucks", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button .setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addShadow()
        button.addTarget(self, action: #selector(alocatebuttonlistner), for: .touchUpInside)
        return button
    }()
    
    let navIcon : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "navigation")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.heightAnchor.constraint(equalToConstant: 20)
        iv.widthAnchor.constraint(equalToConstant: 20)
        return iv
    }()
    
    let FAB:UIView = {
        let lb = UIView()
        lb.backgroundColor = .white
        lb.addShadow()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    @objc func alocatebuttonlistner() {
        displayLoginSheet()
    }
    
    func displayLoginSheet() {
        let viewController = ViewController()
//        viewController.authenticationBottomSheetProtocol =  self
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: viewController)
//        bottomSheet.delegate = self
        bottomSheet.preferredContentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height * 0.50)
        present(bottomSheet, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        self.view.addSubview(collectionView)
        
        self.view.addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        self.view.addConstraintsWithFormat(format: "V:|[v0]-50-|", views: collectionView)
        
        view.addSubview(AllocateButton)
        view.addSubview(FAB)
        
        
        AllocateButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        AllocateButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        AllocateButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        AllocateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        FAB.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: -70).isActive = true
        FAB.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20).isActive = true
        FAB.heightAnchor.constraint(equalToConstant: 50).isActive = true
        FAB.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        FAB.addSubview(navIcon)
        
        navIcon.centerXAnchor.constraint(equalTo: FAB.centerXAnchor).isActive = true
        navIcon.centerYAnchor.constraint(equalTo: FAB.centerYAnchor).isActive = true
        
        
        collectionView.register(TopCell.self, forCellWithReuseIdentifier: TopCellId)
        collectionView.register(CenterCell.self, forCellWithReuseIdentifier: CenterCellId)
        collectionView.register(BottomCell.self, forCellWithReuseIdentifier: BottomCellId)
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        }else {
            return 2
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopCellId, for: indexPath) as! TopCell
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CenterCellId, for: indexPath) as! CenterCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BottomCellId, for: indexPath) as! BottomCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize.init(width: self.collectionView.frame.width, height: 120)
        } else if indexPath.section == 1 {
            return CGSize.init(width: self.collectionView.frame.width, height: 80)
        } else {
            return CGSize.init(width: self.collectionView.frame.width, height: 80)
        }
//        return CGSize.init(width: self.collectionView.frame.width, height: 165)
    }
    
    
}

class TopCell: BaseCell {
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addShadow()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let driverIcon:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "driver")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let driverLabel:UILabel = {
        let lb = UILabel()
        lb.text = "NA"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let distanceIcon:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "distance")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let distanceLabel:UILabel = {
        let lb = UILabel()
        lb.text = "NA"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let truckIcon:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "truck")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let truckLabel:UILabel = {
        let lb = UILabel()
        lb.text = "NA"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let timeIcon:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "time")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let timeLabel:UILabel = {
        let lb = UILabel()
        lb.text = "NA"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let numberPlateIcon:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "number_plate")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let numberPlateLabel:UILabel = {
        let lb = UILabel()
        lb.text = "NA"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let weightIcon:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "weight")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let weightLabel:UILabel = {
        let lb = UILabel()
        lb.text = "NA"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override func setUpViews() {
        
        addSubview(inputsContainerView)
        
        inputsContainerView.addSubview(driverIcon)
        inputsContainerView.addSubview(driverLabel)

        inputsContainerView.addSubview(distanceIcon)
        inputsContainerView.addSubview(distanceLabel)

        inputsContainerView.addSubview(truckIcon)
        inputsContainerView.addSubview(truckLabel)

        inputsContainerView.addSubview(timeIcon)
        inputsContainerView.addSubview(timeLabel)

        inputsContainerView.addSubview(numberPlateIcon)
        inputsContainerView.addSubview(numberPlateLabel)

        inputsContainerView.addSubview(weightIcon)
        inputsContainerView.addSubview(weightLabel)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: inputsContainerView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: inputsContainerView)
        
        //need x,y,width,height constraints
        driverIcon.topAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: 8).isActive = true
        driverIcon.leadingAnchor.constraint(equalTo: inputsContainerView.leadingAnchor, constant: 8).isActive = true
        driverIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        driverIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        //need x,y,width,height constraints
        driverLabel.topAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: 8).isActive = true
        driverLabel.leadingAnchor.constraint(equalTo: driverIcon.trailingAnchor, constant: 8).isActive = true
        driverLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: 8).isActive = true
        driverLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        //need x,y,width,height constraints
        distanceIcon.topAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: 8).isActive = true
        distanceIcon.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 8).isActive = true
        distanceIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        distanceIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        //need x,y,width,height constraints
        distanceLabel.topAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: 8).isActive = true
        distanceLabel.leadingAnchor.constraint(equalTo: distanceIcon.trailingAnchor, constant: 8).isActive = true
        distanceLabel.trailingAnchor.constraint(equalTo: inputsContainerView.trailingAnchor, constant: 8).isActive = true
        distanceLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        //need x,y,width,height constraints
        truckIcon.topAnchor.constraint(equalTo: driverIcon.bottomAnchor, constant: 8).isActive = true
        truckIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        truckIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        truckIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        //need x,y,width,height constraints
        truckLabel.topAnchor.constraint(equalTo: driverIcon.bottomAnchor, constant: 8).isActive = true
        truckLabel.leadingAnchor.constraint(equalTo: truckIcon.trailingAnchor, constant: 8).isActive = true
        truckLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: 8).isActive = true
        truckLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        //need x,y,width,height constraints
        timeIcon.topAnchor.constraint(equalTo: distanceIcon.bottomAnchor, constant: 8).isActive = true
        timeIcon.leadingAnchor.constraint(equalTo: inputsContainerView.centerXAnchor, constant: 8).isActive = true
        timeIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        timeIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        //need x,y,width,height constraints
        timeLabel.topAnchor.constraint(equalTo: distanceIcon.bottomAnchor, constant: 8).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: timeIcon.trailingAnchor, constant: 8).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: inputsContainerView.trailingAnchor, constant: 8).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        //need x,y,width,height constraints
        numberPlateIcon.topAnchor.constraint(equalTo: truckIcon.bottomAnchor, constant: 8).isActive = true
        numberPlateIcon.leadingAnchor.constraint(equalTo: inputsContainerView.leadingAnchor, constant: 8).isActive = true
        numberPlateIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        numberPlateIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        //need x,y,width,height constraints
        numberPlateLabel.topAnchor.constraint(equalTo: truckIcon.bottomAnchor, constant: 8).isActive = true
        numberPlateLabel.leadingAnchor.constraint(equalTo: numberPlateIcon.trailingAnchor, constant: 8).isActive = true
        numberPlateLabel.trailingAnchor.constraint(equalTo: inputsContainerView.centerXAnchor, constant: 8).isActive = true
        numberPlateLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        //need x,y,width,height constraints
        weightIcon.topAnchor.constraint(equalTo: timeIcon.bottomAnchor, constant: 8).isActive = true
        weightIcon.leadingAnchor.constraint(equalTo: inputsContainerView.centerXAnchor, constant: 8).isActive = true
        weightIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        weightIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        //need x,y,width,height constraints
        weightLabel.topAnchor.constraint(equalTo: timeIcon.bottomAnchor, constant: 8).isActive = true
        weightLabel.leadingAnchor.constraint(equalTo: weightIcon.trailingAnchor, constant: 8).isActive = true
        weightLabel.trailingAnchor.constraint(equalTo: inputsContainerView.trailingAnchor, constant: 8).isActive = true
        weightLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
}

class CenterCell: BaseCell {
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addShadow()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let moneyIcon:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "money")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let recivableLabel:UILabel = {
        let lb = UILabel()
        lb.text = "Receivable"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let recivableValueLabel:UILabel = {
        let lb = UILabel()
        lb.text = "INR0.00"
        lb.textColor = UIColor().colorFromHexString("#616161")
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let moneySecondIcon:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "money")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let payableLabel:UILabel = {
        let lb = UILabel()
        lb.text = "Payable"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let payableValueLabel:UILabel = {
        let lb = UILabel()
        lb.text = "INR0.00"
        lb.textColor = UIColor().colorFromHexString("#616161")
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override func setUpViews() {
        addSubview(inputsContainerView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: inputsContainerView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: inputsContainerView)
        
        inputsContainerView.addSubview(moneyIcon)
        inputsContainerView.addSubview(recivableLabel)
        inputsContainerView.addSubview(recivableValueLabel)
        
        inputsContainerView.addSubview(moneySecondIcon)
        inputsContainerView.addSubview(payableLabel)
        inputsContainerView.addSubview(payableValueLabel)
        
        //need x,y,width,height constraints
        moneyIcon.centerYAnchor.constraint(equalTo: inputsContainerView.centerYAnchor).isActive = true
        moneyIcon.leadingAnchor.constraint(equalTo: inputsContainerView.leadingAnchor, constant: 8).isActive = true
        moneyIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        moneyIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        //need x,y,width,height constraints
        recivableLabel.topAnchor.constraint(equalTo: moneyIcon.topAnchor).isActive = true
        recivableLabel.leadingAnchor.constraint(equalTo: moneyIcon.trailingAnchor, constant: 8).isActive = true
        recivableLabel.trailingAnchor.constraint(equalTo: inputsContainerView.centerXAnchor, constant: 4).isActive = true
        recivableLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        //need x,y,width,height constraints
        recivableValueLabel.topAnchor.constraint(equalTo: recivableLabel.bottomAnchor).isActive = true
        recivableValueLabel.leadingAnchor.constraint(equalTo: moneyIcon.trailingAnchor, constant: 8).isActive = true
        recivableValueLabel.trailingAnchor.constraint(equalTo: inputsContainerView.centerXAnchor, constant: 4).isActive = true
        recivableValueLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        
        //need x,y,width,height constraints
        moneySecondIcon.centerYAnchor.constraint(equalTo: inputsContainerView.centerYAnchor).isActive = true
        moneySecondIcon.leadingAnchor.constraint(equalTo: inputsContainerView.centerXAnchor, constant: 8).isActive = true
        moneySecondIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        moneySecondIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
        //need x,y,width,height constraints
        payableLabel.topAnchor.constraint(equalTo: moneySecondIcon.topAnchor).isActive = true
        payableLabel.leadingAnchor.constraint(equalTo: moneySecondIcon.trailingAnchor, constant: 8).isActive = true
        payableLabel.trailingAnchor.constraint(equalTo: inputsContainerView.trailingAnchor, constant: 4).isActive = true
        payableLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true

        //need x,y,width,height constraints
        payableValueLabel.topAnchor.constraint(equalTo: payableLabel.bottomAnchor).isActive = true
        payableValueLabel.leadingAnchor.constraint(equalTo: moneySecondIcon.trailingAnchor, constant: 8).isActive = true
        payableValueLabel.trailingAnchor.constraint(equalTo: inputsContainerView.trailingAnchor, constant: 4).isActive = true
        payableValueLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
    }
}

class BottomCell: BaseCell {
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addShadow()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let lineSepration: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor().colorFromHexString("616161")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let statusIcon:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "drop")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let moneySecondIcon:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "money")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let stopTypeandAddressLabel:UILabel = {
        let lb = UILabel()
        lb.text = "Payable gfdghfjjkjljlkjljlklljkljljkljkljlkghgdghdfghfhfjhgvjkhhikjgfdsfgdsrtserrsrhgnvhj"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let plannedArrivalDateLabel:UILabel = {
        let lb = UILabel()
        lb.text = "Completed"
        lb.textColor = UIColor().colorFromHexString("#616161")
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let loadLabel:UILabel = {
        let lb = UILabel()
        lb.text = "INR0.00"
        lb.textColor = UIColor().colorFromHexString("#616161")
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override func setUpViews() {
        addSubview(inputsContainerView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: inputsContainerView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: inputsContainerView)
        
        addSubview(lineSepration)
        addConstraintsWithFormat(format: "H:|[v0]|", views: lineSepration)
        addConstraintsWithFormat(format: "V:[v0(1)]|", views: lineSepration)
        
        inputsContainerView.addSubview(statusIcon)
        inputsContainerView.addSubview(stopTypeandAddressLabel)
        inputsContainerView.addSubview(plannedArrivalDateLabel)
        inputsContainerView.addSubview(loadLabel)
        
        statusIcon.centerYAnchor.constraint(equalTo: inputsContainerView.centerYAnchor).isActive = true
        statusIcon.leadingAnchor.constraint(equalTo: inputsContainerView.leadingAnchor, constant: 8).isActive = true
        statusIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        statusIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        stopTypeandAddressLabel.topAnchor.constraint(equalTo: statusIcon.topAnchor).isActive = true
        stopTypeandAddressLabel.leadingAnchor.constraint(equalTo: statusIcon.trailingAnchor, constant: 8).isActive = true
        stopTypeandAddressLabel.trailingAnchor.constraint(equalTo: inputsContainerView.trailingAnchor, constant: -30).isActive = true
        stopTypeandAddressLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        plannedArrivalDateLabel.topAnchor.constraint(equalTo: stopTypeandAddressLabel.bottomAnchor,constant: 4).isActive = true
        plannedArrivalDateLabel.leadingAnchor.constraint(equalTo: statusIcon.trailingAnchor, constant: 8).isActive = true
        plannedArrivalDateLabel.trailingAnchor.constraint(equalTo: inputsContainerView.centerXAnchor, constant: -30).isActive = true
        plannedArrivalDateLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        loadLabel.topAnchor.constraint(equalTo: stopTypeandAddressLabel.bottomAnchor,constant: 4).isActive = true
        loadLabel.leadingAnchor.constraint(equalTo: inputsContainerView.centerXAnchor, constant: 8).isActive = true
        loadLabel.trailingAnchor.constraint(equalTo: inputsContainerView.trailingAnchor, constant: -8).isActive = true
        loadLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
}

class BaseCell:UICollectionViewCell {
    override init(frame:CGRect) {
        super.init(frame:frame)
        setUpViews()
        
        
    }
    func setUpViews() {
        
    }
    required init(coder aDecoder:NSCoder) {
        fatalError("init error")
    }
}
