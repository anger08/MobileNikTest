//
//  RecipesHomePresenter.swift
//  MobilenikTest
//
//  Created by Angelber Castro on 5/11/22.
//

import Foundation

protocol RecipesHomePresentationLogic {
    func presentRecipes(response: [RecipesHomeModel.Recipes.Response])
    func presentError(response: RecipesHomeModel.Error.Response)
}

class RecipesHomePresenter: RecipesHomePresentationLogic {
    
    weak var viewController: RecipesHomeDisplayLogic?
    
    // MARK: - Present Posts
    func presentRecipes(response: [RecipesHomeModel.Recipes.Response]) {
        let viewModel = RecipesHomeModel.Recipes.ViewModel(data: response)
        viewController?.displayRecipes(viewModel: viewModel, on: .main)
    }
    
    // MARK: - Present Error
    func presentError(response: RecipesHomeModel.Error.Response) {
        let viewModel = RecipesHomeModel.Error.ViewModel(error: response.error)
        viewController?.displayError(viewModel: viewModel, on: .main)
    }
}
