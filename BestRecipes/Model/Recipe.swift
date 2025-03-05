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
