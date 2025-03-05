//
//  Alert.swift
//  BestRecipes
//
//  Created by Rohan Patel on 3/3/25.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissBtn: Alert.Button
}

struct AlertContext {
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("Unable to get data from server. Please contact support."),
                                      dismissBtn: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                      message: Text("Something went wrong. Please try again later."),
                                      dismissBtn: .default(Text("OK")))
    
    static let invalidData = AlertItem(title: Text("Server Error"),
                                      message: Text("Something went wrong. If the issue persists, contact support."),
                                      dismissBtn: .default(Text("OK")))
    
    static let requestFailed = AlertItem(title: Text("Server Error"),
                                      message: Text("Unable to complete your request. Please check your internet connection."),
                                      dismissBtn: .default(Text("OK")))
}


