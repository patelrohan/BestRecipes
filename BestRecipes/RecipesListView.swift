//
//  ContentView.swift
//  BestRecipes
//
//  Created by Rohan Patel on 2/18/25.
//

import SwiftUI

struct RecipesListView: View {
    var body: some View {
        NavigationStack{
            List(MockData.recipes, id: \.uuid){ recipe in
                RecipeCell(recipe: recipe)
            }
            .navigationTitle(Text("🍪 Recipes 🍱"))
        }
    }
}


struct RecipeCell: View{
    
    var recipe: Recipe
    
    var body: some View{
        HStack{
            Image("chocolate_raspberry_brownies_small")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 125, height: 100)
                .clipShape(.rect(cornerRadius: 8))
            
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
