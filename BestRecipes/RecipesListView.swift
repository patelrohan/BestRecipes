//
//  ContentView.swift
//  BestRecipes
//
//  Created by Rohan Patel on 2/18/25.
//

import SwiftUI

struct RecipesListView: View {
    
    @StateObject private var viewModel = RecipesListViewModel()
    
    var body: some View {
        NavigationStack{
            List(viewModel.recipes, id: \.uuid){ recipe in
                RecipeCell(recipe: recipe)
            }
            .navigationTitle(Text("🍪 Best Recipes 🍱"))
        }
        .task {
            viewModel.getRecipes()
        }
    }
}


struct RecipeCell: View{
    
    var recipe: Recipe
    
    var body: some View{
        HStack{
            Image("chocolate_raspberry_brownies_small")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 90)
                .clipShape(.rect(cornerRadius: 5))
            
            VStack(alignment: .leading, spacing: 5){
                Text(recipe.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(recipe.cuisine)
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                
                HStack{
                    Image(systemName: "link.circle.fill")
                    Image(systemName: "video.fill")
                }
            }
        }
    }
}


#Preview {
    RecipesListView()
}
