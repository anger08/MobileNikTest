//
//  GeneralRoute.swift
//  MobilenikTest
//
//  Created by Angelber Castro on 5/11/22.
//

import Foundation
import UIKit

enum GeneralRoute: IRouter {
    case recipesHome
}

extension GeneralRoute {
    var scene: UIViewController? {
        switch self {
        case .recipesHome:
            return RecipesHomeViewController()
        }
    }
}
