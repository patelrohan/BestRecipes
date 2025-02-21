//
//  RemoteImage.swift
//  BestRecipes
//
//  Created by Rohan Patel on 2/20/25.
//

import SwiftUI

@MainActor final class ImageLoader: ObservableObject{
    
    @Published var image: Image? = nil
    
    func downloadImage(fromUrl url: String?){
        Task{
            do{
                guard let uiImage = try await NetworkManager.shared.downloadImage(fromUrl: url) else{ return }
                self.image = Image(uiImage: uiImage)
                
            }
        }
    }
}


struct RemoteImage: View{
    
    var image: Image?
    
    var body: some View{
        image?.resizable() ?? Image("food-placeholder")
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
