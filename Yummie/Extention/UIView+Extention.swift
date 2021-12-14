//
//  UIView+Extention.swift
//  Yummie
//
//  Created by mohsen on 01/12/2021.
//

import UIKit

extension UIView{
   @IBInspectable var cornerRadius : CGFloat{
        get{return cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
