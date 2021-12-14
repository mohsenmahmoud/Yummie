//
//  DishListTableViewCell.swift
//  Yummie
//
//  Created by mohsen on 02/12/2021.
//

import UIKit

class DishListTableViewCell: UITableViewCell {

 static let identifier = "DishListTableViewCell"
    @IBOutlet weak var dishImageViewCell: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var descriptionLable: UILabel!
    
    func setup(dish: Dish){
        
        dishImageViewCell.kf.setImage(with:dish.image?.asUrl)
        titleLable.text = dish.name
        descriptionLable.text = dish.description
    }
    
    func setup(order: Order){
        
        dishImageViewCell.kf.setImage(with:order.dish?.image?.asUrl)
        titleLable.text = order.dish?.name
        descriptionLable.text = order.name
    }
 
    
}
