//
//  RecipesHomeModels.swift
//  MobilenikTest
//
//  Created by Angelber Castro on 5/11/22.
//

import Foundation

enum RecipesHomeModel {
    // MARK: Use cases
    enum Recipes {
        struct Request {
        }
        
        struct Response: Codable {
            // MARK: - DataClass
            struct DataClass: Codable {
            }
            
            let calories: String?
            let carbos: String?
            let description: String?
            let difficulty: Int?
            let fats: String?
            let headline: String?
            let id: String?
            let image: String?
            let name: String?
            let proteins: String?
            let thumb: String?
            let time: String?
            
            enum CodingKeys: String, CodingKey {
                case calories
                case carbos
                case description
                case difficulty
                case fats
                case headline
                case id
                case image
                case name
                case proteins
                case thumb
                case time
            }
        }
        
        struct ViewModel {
            let data: [RecipesHomeModel.Recipes.Response]
            
        }
    }
    
    enum Error {
        struct Request {
        }
        struct Response {
            var error: RecipesHomeError
        }
        struct ViewModel {
            var error: RecipesHomeError
        }
    }
}
