//
//  RecipesHomeError.swift
//  MobilenikTest
//
//  Created by Angelber Castro on 5/11/22.
//

import Foundation

enum RecipesHomeError: Error, CustomStringConvertible {
    case request
    case network(Error)
    case parse(Error)
    case server(description: String)
    
    var description: String {
        switch self {
        case .network(let error), .parse(let error):
            return error.localizedDescription
        case .request:
            return "Error request"
        case .server(let description):
            return description
        }
    }
}
