//
//  ModelError.swift
//  Domains
//
//  Created by George Dambara on 2024/01/26.
//

import Foundation

enum ModelError : Error{
    case argumentError(message: String?)
    case argumentNullError(message: String?)
    case argumentIndexOutOfRangeError(message: String?)
}
