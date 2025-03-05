//
//  RecipesListViewModel.swift
//  BestRecipes
//
//  Created by Rohan Patel on 2/18/25.
//

import Foundation

@MainActor class RecipesListViewModel: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    @Published var isLoadingRecipes = false
    @Published var alertItem: AlertItem?
    
    
    /// Fetches recipes from the API
    func getRecipes(){
        print("getRecipes()")
        isLoadingRecipes = true
        Task{
            do{
                recipes = try await NetworkManager.shared.fetchRecipes()
                isLoadingRecipes = false
            }catch{
                if let networkError = error as? NetworkError{
                    switch networkError{
                        
                        case .invalidURL:
                            alertItem = AlertContext.invalidURL
                            
                        case .invalidData:
                            alertItem = AlertContext.invalidData
                            
                        case .invalidResponse:
                            alertItem = AlertContext.invalidResponse
                            
                        case .requestFailed:
                            alertItem = AlertContext.requestFailed
                    }
                }else{
                    alertItem = AlertContext.invalidResponse
                }
                isLoadingRecipes = false
            }
        }
    }
    
    
    /// Removes all recipes when triggered from pull to refresh
    func refresh(){
        recipes.removeAll()
        getRecipes()
    }
}
