//
//  BestRecipesTests.swift
//  BestRecipesTests
//
//  Created by Rohan Patel on 2/18/25.
//

import XCTest
@testable import BestRecipes

final class BestRecipesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testfetchRecipes() async throws{
        do{
            let recipes = try await NetworkManager.shared.fetchRecipes()
            XCTAssertTrue(recipes.count > 0, "Expected at least 1 recipe")
        }catch{
            XCTFail("Fetchin recipes failed with error: \(error)")
        }
    }
    
    func testImageDownloadAndCacheSucess() async throws {
        do{
            let imageUrl = "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg"
            let image = try await NetworkManager.shared.downloadImage(fromUrl: imageUrl)
            XCTAssertNotNil(image, "Unsuccessful image download")
            
            let cachedImage = NetworkManager.shared.retrieveImageFromCache(location: imageUrl)
            XCTAssertNotNil(cachedImage, "Unsuccessful image retrieval from Cache.")
        }catch{
            XCTFail("Downloading recipe image failed with error: \(error)")
        }
    }
    
    func testImageRetrievalFromCacheFailure() {
            let imageUrl = "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg"
            let cachedImage = NetworkManager.shared.retrieveImageFromCache(location: imageUrl)
            XCTAssertNil(cachedImage, "Unsuccessful. Image should not be in cache.")
    }
    
}
