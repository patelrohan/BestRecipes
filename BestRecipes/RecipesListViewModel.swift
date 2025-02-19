//
//  RecipesListViewModel.swift
//  BestRecipes
//
//  Created by Rohan Patel on 2/18/25.
//

import Foundation

@MainActor class RecipesListViewModel: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    
    func getRecipes(){
        Task{
            do{
                recipes = try await NetworkManager.shared.fetchRecipes()
                print(recipes)
            }catch{
                print(error)
            }
        }
    }
}
