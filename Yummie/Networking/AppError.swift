//
//  AppError.swift
//  Yummie
//
//  Created by mohsen on 04/12/2021.
//

import Foundation
 enum AppError : LocalizedError{
    
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
     
     var errorDescription: String?{
         switch self {
         case .errorDecoding:
             return "Response could not be decoded"
         case .unknownError:
             return "Bruhhh !!! l have no idea what go on "
         case .invalidUrl:
             return " HEYYYY !!! Give me a valid URL"
         case .serverError(let error):
             return error
         }
     }
}
