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
        ZStack {
            NavigationStack{
                List(viewModel.recipes, id: \.uuid){ recipe in
                    RecipeCell(recipe: recipe)
                }
                .navigationTitle(Text("🍪 Best Recipes 🍱"))
            }
            .task {
                viewModel.getRecipes()
            }
            if viewModel.isLoading{
                LoadingView()
            }
        }
    }
}


struct RecipeCell: View{
    
    var recipe: Recipe
    
    var body: some View{
        HStack{
            RecipeImage(urlString: recipe.photo_url_small)
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 90)
                .clipShape(.rect(cornerRadius: 5))
            
            VStack(alignment: .leading, spacing: 5){
                Text(recipe.name)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(recipe.cuisine)
                    .font(.subheadline)
                
                HStack{
                    if let articleURLString = recipe.source_url,
                        let articleURL = URL(string: articleURLString){
                        Link(destination: articleURL) {
                            Image(systemName: "link.circle.fill")
                                .tint(.brandPrimary)
                        }
                    }
                    if let youtubeURLString = recipe.youtube_url,
                       let youtubeURL = URL(string: youtubeURLString){
                        Link(destination: youtubeURL) {
                            Image(systemName: "video.fill")
                                .tint(.brandPrimary)
                        }
                    }
                }
            }
        }
    }
}


struct LoadingView: View{
    
    var body: some View{
        ZStack(alignment: .center){
            Color(.systemBackground)
                .opacity(0.8)
                .ignoresSafeArea(.all)
            
            VStack(spacing: 35){
                ProgressView()
                    .scaleEffect(2.5)
                    .tint(.brandPrimary)
                
                Text("Loading best recipes on the planet...")
                    .font(.subheadline)
            }
            .frame(width: 250, height: 150, alignment: .center)
            .padding()
        }
    }
}

#Preview {
    RecipesListView()
}
