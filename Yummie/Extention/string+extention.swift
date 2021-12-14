//
//  string+extention.swift
//  Yummie
//
//  Created by mohsen on 01/12/2021.
//

import Foundation
extension String{
    var asUrl: URL?{
        return URL(string: self)
    }
}
