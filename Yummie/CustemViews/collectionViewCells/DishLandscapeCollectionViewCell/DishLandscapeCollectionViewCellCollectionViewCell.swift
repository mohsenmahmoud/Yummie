//
//  DishLandscapeCollectionViewCellCollectionViewCell.swift
//  Yummie
//
//  Created by mohsen on 02/12/2021.
//

import UIKit

class DishLandscapeCollectionViewCellCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: DishLandscapeCollectionViewCellCollectionViewCell.self)
 
    @IBOutlet weak var DishImageView: UIImageView!
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var DescriptionLable: UILabel!
    @IBOutlet weak var CaloriesLable: UILabel!
    
    func setup(dish : Dish){
        
        DishImageView.kf.setImage(with:dish.image?.asUrl)
        titleLable.text = dish.name ?? "name"
        DescriptionLable.text = dish.description
        CaloriesLable.text = dish.formattedCalories
    }
}
