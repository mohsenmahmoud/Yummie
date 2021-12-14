//
//  UIViewController+Extention.swift
//  Yummie
//
//  Created by mohsen on 02/12/2021.
//

import UIKit
import Kingfisher
extension UIViewController{
    
    static var identifire : String {
        return String(describing:self)
    }
    
    static func instance() -> Self{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: identifire) as! Self
        
    return controller
        
    }
}
