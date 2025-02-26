//
//  RecipesListViewModel.swift
//  BestRecipes
//
//  Created by Rohan Patel on 2/18/25.
//

import Foundation

@MainActor class RecipesListViewModel: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    @Published var isLoading = false
    
    func getRecipes(){
        isLoading = true
        Task{
            do{
                recipes = try await NetworkManager.shared.fetchRecipes()
                isLoading = false
            }catch{
                print(error)
            }
        }
    }
}
