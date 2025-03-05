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
                    VStack{
                        RecipeCell(recipe: recipe)
                    }
                }
                .listStyle(.plain)
                .navigationTitle(Text("🍪 Best Recipes 🍱"))
                .refreshable {
                    viewModel.refresh()
                }
                .buttonStyle(.borderless)
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissBtn)
            }
            
            if (viewModel.isLoadingRecipes || imageLoader.isLoadingRecipeThumbnails){
                LoadingView()
            }
            
            else if !viewModel.isLoadingRecipes && viewModel.recipes.isEmpty{
                EmptyRecipesListView(imageName:"fork.knife.circle", message: "No recipes found. \nTry again later.")
                    .environmentObject(viewModel)
            }
        }
        .task {
            viewModel.getRecipes()
        }
    }
}


struct RecipeCell: View{
    
    var recipe: Recipe
    
    var body: some View{
        VStack{
            RecipeImage(urlString: recipe.photo_url_large)
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width - 50, height: 175)
                .clipped()
                .clipShape(.rect(cornerRadius: 5))
            
            
            HStack(spacing: 15){
                
                VStack(alignment: .leading){
                    Text(recipe.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(recipe.cuisine)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
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
