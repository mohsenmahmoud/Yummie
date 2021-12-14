//
//  categoryCollectionViewCell.swift
//  Yummie
//
//  Created by mohsen on 01/12/2021.
//

import UIKit
import Kingfisher

class categoryCollectionViewCell: UICollectionViewCell {
    
  static let identifier = String(describing: categoryCollectionViewCell.self)

    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryTitleLable: UILabel!
    
    
    
    func setup(category : DishCategory){
        categoryTitleLable.text = category.title ?? "title"
        categoryImageView.kf.setImage(with : category.image?.asUrl)
        
    }
    
}
