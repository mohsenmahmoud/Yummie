//
//  Route.swift
//  Yummie
//
//  Created by mohsen on 04/12/2021.
//

import Foundation
import SwiftUI
enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    case fetchAllCategories
    case placeOrder(String)
    case fetchCategorydishes(String)
    case fetchOrders
    
    var description : String {
        switch self {
        case .fetchAllCategories : return "/dish-categories"
        case .placeOrder(let dishId) : return "/orders/\(dishId)"
        case.fetchCategorydishes(let categoryId) : return "/dishes/\(categoryId)"
        case .fetchOrders : return "/orders"
        }
    }
}
