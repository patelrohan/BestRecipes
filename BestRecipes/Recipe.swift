//
//  Recipe.swift
//  BestRecipes
//
//  Created by Rohan Patel on 2/18/25.
//

import Foundation

struct Recipe: Decodable{
    let cuisine: String
    let name: String
    let photo_url_large: String?
    let photo_url_small: String?
    let uuid: String
    let source_url: String?
    let youtube_url: String?
}

struct RecipesResponse: Decodable{
    let recipes: [Recipe]
}

struct MockData{
    static let sampleRecipe = Recipe(cuisine: "American",
                                     name: "Chocolate Raspberry Brownies",
                                     photo_url_large: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/74aa9345-00ae-4178-9aa7-8fcee19af160/large.jpg",
                                     photo_url_small: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/74aa9345-00ae-4178-9aa7-8fcee19af160/small.jpg",
                                     uuid: "606f22ce-fcd1-434e-a6da-9571c0b2fc9b",
                                     source_url: "https://www.bbcgoodfood.com/recipes/2121648/bestever-chocolate-raspberry-brownies",
                                     youtube_url: "https://www.youtube.com/watch?v=Pi89PqsAaAg")
    
    static let recipes: [Recipe] = [Recipe].init(repeating: sampleRecipe, count: 10)
}
