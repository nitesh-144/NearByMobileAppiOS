//
//  UIView+Extension.swift
//  NearBy
//
//  Created by Deepika Vyas on 16/12/23.
//

import UIKit

extension UIView{
    func anchor(top: NSLayoutYAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topPadding: CGFloat = 0, leftPadding: CGFloat = 0, rightPadding: CGFloat = 0, bottomPadding: CGFloat = 0, width: CGFloat? = nil, height: CGFloat? = nil){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            self.topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        if let bottom = bottom{
            self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
        }
        if let left = left{
            self.leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
        }
        if let rigth = right{
            self.rightAnchor.constraint(equalTo: rigth, constant: -rightPadding).isActive = true
        }
        if let widht = width{
            self.widthAnchor.constraint(equalToConstant: widht).isActive = true
        }
        if let height = height{
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    
    }
}
