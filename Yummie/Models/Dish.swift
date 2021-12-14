//
//  Dish.swift
//  Yummie
//
//  Created by mohsen on 02/12/2021.
//

import Foundation


struct Dish : Decodable{
    
    let id , name , description , image : String?
    let calories : Int?
    
    var formattedCalories : String{
        return  "\(calories ?? 0) calories"
    }
}
