//
//  NetworkError.swift
//  BestRecipes
//
//  Created by Rohan Patel on 2/18/25.
//

import Foundation

enum NetworkError: Error{
    case invalidURL
    case invalidData
    case invalidResponse
    case requestFailed
}
