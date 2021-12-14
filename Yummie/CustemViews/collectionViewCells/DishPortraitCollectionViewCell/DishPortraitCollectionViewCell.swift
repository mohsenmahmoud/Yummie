//
//  DishPortraitCollectionViewCell.swift
//  Yummie
//
//  Created by mohsen on 02/12/2021.
//

import UIKit

class DishPortraitCollectionViewCell: UICollectionViewCell {
    static let identifier = "DishPortraitCollectionViewCell"
    

    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var dishIMageView: UIImageView!
    @IBOutlet weak var caloriesLable: UILabel!

    @IBOutlet weak var DescriptionLable: UILabel!
    
    
    func setup(dish : Dish){
        titleLable.text = dish.name ?? "name"
        dishIMageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLable.text = dish.formattedCalories
        DescriptionLable.text = dish.description
    }
    

    
}
