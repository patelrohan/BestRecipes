//
//  NetworkManager.swift
//  BestRecipes
//
//  Created by Rohan Patel on 2/18/25.
//

import Foundation

final class NetworkManager{
    
    static let shared = NetworkManager()
    
    private init() {}
    
    static let baseURL      = "https://d3jbb8n5wk0qxi.cloudfront.net/"
    private let recipeURL    = baseURL + "recipes.json"
    private let emptyURL     = baseURL + "recipes-empty.json"
    private let malformedURL = baseURL + "recipes-malformed.json"
    
    func fetchRecipes() async throws -> [Recipe]{
        
        guard let url = URL(string: recipeURL) else{
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        do{
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(RecipesResponse.self, from: data)
            return decodedResponse.recipes
        }catch{
            print("Decoding error: \(error)")  // Print the specific decoding error
            throw NetworkError.invalidData
        }
    }
}



