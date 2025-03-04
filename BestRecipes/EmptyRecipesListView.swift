//
//  EmptyRecipesListView.swift
//  BestRecipes
//
//  Created by Rohan Patel on 3/4/25.
//

import SwiftUI

struct EmptyRecipesListView: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 125)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    EmptyRecipesListView(imageName: "fork.knife.circle", message: "This is a very very very long test message for preview")
}
