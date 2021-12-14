//
//  Order.swift
//  Yummie
//
//  Created by mohsen on 02/12/2021.
//

import Foundation
struct Order : Decodable {
    
    let id , name : String?
    
    let dish : Dish?
}
