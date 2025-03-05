//
//  NetworkManager.swift
//  BestRecipes
//
//  Created by Rohan Patel on 2/18/25.
//

import UIKit

final class NetworkManager{
    
    static let shared = NetworkManager()
    
    private let imageCache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    static let  baseURL      = "https://d3jbb8n5wk0qxi.cloudfront.net/"
    private let recipeURL    = baseURL + "recipes.json"
    private let emptyURL     = baseURL + "recipes-empty.json"
    private let malformedURL = baseURL + "recipes-malformed.json"
    
    func fetchRecipes() async throws -> [Recipe]{
        
        guard let url = URL(string: recipeURL) else{
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw NetworkError.invalidResponse
        }
        
        do{
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(RecipesResponse.self, from: data)
            return decodedResponse.recipes
        }catch{
            throw NetworkError.invalidData
        }
    }
    
    func downloadImage(fromUrl urlString: String?) async throws -> UIImage?{
         
         guard let urlString = urlString else{
             throw NetworkError.invalidURL
         }
     
        if let image = retrieveImageFromCache(location: urlString){
             return image
         }
         
         guard let url = URL(string: urlString) else{
             throw NetworkError.invalidURL
         }
         
         let (data, _) = try await URLSession.shared.data(from: url)

         guard let image = UIImage(data: data) else{
             throw NetworkError.invalidData
         }
         
        self.imageCache.setObject(image, forKey: NSString(string: urlString) )
         return image
     }
    
    
    func retrieveImageFromCache(location cacheKey: String) -> UIImage?{
            return imageCache.object(forKey: NSString(string: cacheKey))
    }
}



