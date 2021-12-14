//
//  UserDefaults+Extention.swift
//  Yummie
//
//  Created by mohsen on 05/12/2021.
//

import Foundation
extension UserDefaults{
    private enum UserDefaultsKeys : String {
        case hasOnboarded
        
    }
        var hasOnboarded : Bool {
            get{
                bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
            }
            set{
                setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
            }
        }
    }

