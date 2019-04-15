//
//  Extension.swift
//  Assignment
//
//  Created by Uday Mishra on 12/04/19.
//  Copyright © 2019 Uday Mishra. All rights reserved.
//

import UIKit


extension UIColor {
    func colorFromHexString (_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

extension UIView {
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func visiblity(gone: Bool, dimension: CGFloat = 0.0, attribute: NSLayoutConstraint.Attribute = .height) -> Void {
        if let constraint = (self.constraints.filter{$0.firstAttribute == attribute}.first) {
            constraint.constant = gone ? 0.0 : dimension
            self.layoutIfNeeded()
            self.isHidden = gone
        }
    }
    
}

extension UIView {
    func addShadow() {
        self.layer.cornerRadius =  4
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset =  CGSize(width: 0, height: 2)
    }
    
    func removeShadow() {
        self.layer.shadowOpacity = 0.0
    }
}

extension UIImageView {
    func makeRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
}

extension UIView {
    func addCurvedBorder(radius:CGFloat? = 4,borderColor:CGColor? = UIColor.white.cgColor,boderWidth:Int? = 1) {
        self.layer.cornerRadius = 4
        self.layer.borderColor = borderColor
        self.layer.borderWidth = 1
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
    
    func addBorder(borderColor:CGColor? = UIColor().colorFromHexString("#616161").cgColor,boderWidth:Int? = 1) {
        self.layer.borderColor = borderColor
        self.layer.borderWidth = 1
    }
}
