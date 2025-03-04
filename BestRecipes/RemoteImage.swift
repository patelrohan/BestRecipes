//
//  RemoteImage.swift
//  BestRecipes
//
//  Created by Rohan Patel on 2/20/25.
//

import SwiftUI

@MainActor final class ImageLoader: ObservableObject{
    
    @Published var image: Image? = nil
    @Published var isLoadingRecipeThumbnails = false
    
    func downloadImage(fromUrl url: String?){
        
        isLoadingRecipeThumbnails = true
        Task{
            do{
                guard let uiImage = try await NetworkManager.shared.downloadImage(fromUrl: url) else{ return }
                self.image = Image(uiImage: uiImage)
                isLoadingRecipeThumbnails = false
                
            }
        }
    }
}


struct RemoteImage: View{
    
    var image: Image?
    
    var body: some View{
        image?.resizable() ?? Image(systemName: "fork.knife.circle")
    }
}


struct RecipeImage: View{
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String?
    
    var body: some View{
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.downloadImage(fromUrl: urlString) }
    }
}
