//
//  ContentView.swift
//  BestRecipes
//
//  Created by Rohan Patel on 2/18/25.
//

import SwiftUI

struct RecipesListView: View {
    
    @StateObject private var viewModel = RecipesListViewModel()
    @StateObject var imageLoader = ImageLoader()
    
    var body: some View {
        ZStack {
            NavigationStack{
                List(viewModel.recipes, id: \.uuid){ recipe in
                    RecipeCell(recipe: recipe)
                }
                .navigationTitle(Text("🍪 Best Recipes 🍱"))
                .refreshable {
                    viewModel.refresh()
                }
                .buttonStyle(.borderless)
            }
            .task {
                viewModel.getRecipes()
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissBtn)
            }
            
            if (viewModel.isLoadingRecipes || imageLoader.isLoadingRecipeThumbnails){
                LoadingView()
            }
            
            else if !viewModel.isLoadingRecipes && viewModel.recipes.isEmpty{
                EmptyRecipesListView(imageName:"fork.knife.circle", message: "No recipes found. \nTry again later.")
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
                .frame(width: 120, height: 120)
                .clipShape(.rect(cornerRadius: 7.5))
            
            VStack(alignment: .leading, spacing: 5){
                Text(recipe.name)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(recipe.cuisine)
                    .font(.subheadline)
                
                HStack(spacing: 12.5){
                    if let articleURLString = recipe.source_url, let articleURL = URL(string: articleURLString){
                        Link(destination: articleURL) {
                            Image(systemName: "link.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .tint(.brandPrimary)
                                .frame(width: 30, height: 30)
                        }
                    }
                
                    if let youtubeURLString = recipe.youtube_url, let youtubeURL = URL(string: youtubeURLString){
                        Link(destination: youtubeURL) {
                            Image(systemName: "video.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32.5, height: 35)
                                .tint(.brandPrimary)
                                
                        }
                    }
                }.offset(y:5)
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
