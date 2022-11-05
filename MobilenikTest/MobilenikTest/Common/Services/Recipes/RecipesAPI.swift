//
//  RecipesAPI.swift
//  MobilenikTest
//
//  Created by Angelber Castro on 5/11/22.
//

import Foundation

// MARK: - PostsServiceProtocol
protocol RecipesServiceProtocol {
    func getRecipes(request: RecipesHomeModel.Recipes.Request, completion: @escaping (Result<[RecipesHomeModel.Recipes.Response], RecipesHomeError>) -> Void)
}

// MARK: - PostsAPI
class RecipesAPI: RecipesServiceProtocol {
// Comunication with EndPoint
    func getRecipes(request: RecipesHomeModel.Recipes.Request, completion: @escaping (Result<[RecipesHomeModel.Recipes.Response], RecipesHomeError>) -> Void) {
        NetworkService.share.request(endpoint: RecipesHomeEndpoint.getRecipes) { result in
            switch result {
            case .success:
                do {
                    let data = try result.get()
                    let response = try JSONDecoder().decode([RecipesHomeModel.Recipes.Response].self, from: data!)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.parse(error)))
                }
            case .failure(let error):
                completion(.failure(.network(error)))
            }
        }
    }
}
