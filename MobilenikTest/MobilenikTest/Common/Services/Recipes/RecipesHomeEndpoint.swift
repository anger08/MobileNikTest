//
//  RecipesHomeEndpoint.swift
//  MobilenikTest
//
//  Created by Angelber Castro on 5/11/22.
//

import Foundation
import Alamofire

enum RecipesHomeEndpoint {
    case getRecipes
}

extension RecipesHomeEndpoint: MBEndpoint {
    var method: HTTPMethod {
        switch self {
        case .getRecipes:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getRecipes:
            return "recipes.json"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .getRecipes:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .getRecipes:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
