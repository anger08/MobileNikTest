//
//  RecipesHomeRouter.swift
//  MobilenikTest
//
//  Created by Angelber Castro on 5/11/22.
//

import Foundation

@objc protocol RecipesHomeRoutingLogic {
}

protocol RecipesHomeDataPassing {
    var dataStore: RecipesHomeDataStore? { get }
}

class RecipesHomeRouter: NSObject, RecipesHomeRoutingLogic, RecipesHomeDataPassing {
    weak var viewController: RecipesHomeViewController?
    var dataStore: RecipesHomeDataStore?
  
}
