//
//  RecipesHomeInteractor.swift
//  MobilenikTest
//
//  Created by Angelber Castro on 5/11/22.
//

import UIKit

protocol RecipesHomeBusinessLogic {
    func getRecipes(request: RecipesHomeModel.Recipes.Request)
}

protocol RecipesHomeDataStore {
}

class RecipesHomeInteractor: RecipesHomeBusinessLogic, RecipesHomeDataStore {
    
    var presenter: RecipesHomePresentationLogic?
    
    var worker: RecipesServiceProtocol
    
    init(worker: RecipesServiceProtocol = RecipesAPI()) {
        self.worker = worker
    }
    
    // MARK: - Methods
    func getRecipes(request: RecipesHomeModel.Recipes.Request) {
        worker.getRecipes(request: request, completion: { result in
            switch result {
            case .success(let response):
                self.presenter?.presentRecipes(response: response)
            case .failure(let error):
                let response = RecipesHomeModel.Error.Response(error: error)
                self.presenter?.presentError(response: response)
            }
        })
    }

}


